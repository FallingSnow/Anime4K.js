import PassThrough from "../glsl/passthrough";
import Anime4KShader from "../glsl/shader";
import { createTexture, TextureData } from "../utils/index";

export default class ImageUpscaler {
  private source: TexImageSource | null = null;
  private canvas: HTMLCanvasElement | OffscreenCanvas;
  private gl!: WebGLRenderingContext;

  private config: (new (gl: WebGLRenderingContext) => Anime4KShader)[];

  private textures = new Map<string, TextureData>();
  private framebuffer: WebGLFramebuffer | null = null;
  private programs: Anime4KShader[] | null = null;
  private passthrough: PassThrough | null = null;

  public constructor(
    config: (new (gl: WebGLRenderingContext) => Anime4KShader)[],
    canvas: HTMLCanvasElement | OffscreenCanvas
  ) {
    if (!ImageUpscaler.isSupported()) throw new Error("Unsupported");

    this.config = config;
    this.canvas = canvas;

    this.initializeWEBGL();
  }

  private initializeWEBGL() {
    const gl = this.canvas.getContext("webgl", {
      premultipliedAlpha: false,
      stencil: false,
      depth: false,
    });
    if (gl === null) throw new Error("Failed to get webgl render context");
    this.gl = gl;
    gl.disable(gl.DEPTH_TEST);
    gl.disable(gl.STENCIL_TEST);
    gl.clearColor(0, 0, 0, 0);
    gl.clear(gl.COLOR_BUFFER_BIT);

    this.framebuffer = gl.createFramebuffer()!;

    this.programs = this.config.map((constuctor) => new constuctor(gl));
    this.passthrough = new PassThrough(gl);
  }

  public static isSupported(): boolean {
    const canvas = document.createElement("canvas");
    const gl = canvas.getContext("webgl");
    if (
      !gl ||
      gl.getExtension("OES_texture_float") == null ||
      gl.getExtension("OES_texture_float_linear") == null
    ) {
      return false;
    }
    return true;
  }

  public upscale() {
    if (!this.source) {
      return new Error("no attached source");
    }
    if (!this.canvas) {
      return new Error("no attached canvas");
    }
    if (!this.gl) {
      return new Error("no gl render context");
    }
    if (!this.framebuffer) {
      return new Error("no framebuffer");
    }
    if (!this.programs) {
      return new Error("no programs");
    }
    if (!this.passthrough) {
      return new Error("no passthrough");
    }

    const gl = this.gl;
    const framebuffer = this.framebuffer;
    const ext =
      gl.getExtension("OES_texture_half_float_linear") &&
      // EXT_color_buffer_half_float solves "WebGL warning: drawArraysInstanced: Using format enabled by implicitly enabled extension: EXT_color_buffer_half_float. For maximal portability enable it explicitly." console warning.
      gl.getExtension("EXT_color_buffer_half_float") &&
      gl.getExtension("OES_texture_half_float");

    // init texture
    const in_texture = createTexture(gl, gl.LINEAR);
    if (!in_texture) {
      return new Error("no input texture");
    }
    gl.bindTexture(gl.TEXTURE_2D, in_texture);
    gl.texImage2D(
      gl.TEXTURE_2D,
      0,
      gl.RGBA,
      gl.RGBA,
      ext?.HALF_FLOAT_OES ?? gl.FLOAT,
      this.source
    );
    gl.bindTexture(gl.TEXTURE_2D, null);

    const native_texture = createTexture(gl, gl.LINEAR);
    if (!native_texture) {
      return new Error("no native texture");
    }

    const output_texture = createTexture(gl, gl.LINEAR);
    if (!output_texture) {
      return new Error("no output texture");
    }

    const in_width = this.sourceWidth;
    const in_height = this.sourceHeight;
    const out_width = this.canvas.width,
      out_height = this.canvas.height;

    // use Texture
    {
      if (this.textures.has("NATIVE")) {
        gl.deleteTexture(this.textures.get("NATIVE")!.texture);
        this.textures.delete("NATIVE");
      }
      this.textures.set("NATIVE", {
        texture: native_texture,
        width: in_width,
        height: in_height,
      });
    }
    {
      if (this.textures.has("OUTPUT")) {
        gl.deleteTexture(this.textures.get("OUTPUT")!.texture);
        this.textures.delete("OUTPUT");
      }
      this.textures.set("OUTPUT", {
        texture: output_texture,
        width: out_width,
        height: out_height,
      });
    }
    {
      if (this.textures.has("MAIN")) {
        gl.deleteTexture(this.textures.get("MAIN")!.texture);
        this.textures.delete("MAIN");
      }
      this.textures.set("MAIN", {
        texture: in_texture,
        width: in_width,
        height: in_height,
      });
    }
    this.programs.forEach((program) =>
      program.hook_MAIN(this.textures, framebuffer!)
    );

    if (this.textures.has("MAIN")) {
      const MAIN = this.textures.get("MAIN")!;
      this.textures.set("PREKERNEL", MAIN);
      this.textures.delete("MAIN");
      this.programs.forEach((program) =>
        program.hook_PREKERNEL(this.textures, framebuffer)
      );
    }

    this.passthrough.render(
      this.textures.get("PREKERNEL")!,
      out_width,
      out_height
    );

    gl.flush();
  }
  public attachSource(source: TexImageSource) {
    this.source = source;
    this.adjustCanvasSize();
  }
  public detachSource() {
    this.source = null;
  }
  private get sourceWidth(): number {
    if (!this.source) return 0;

    if (this.source instanceof HTMLVideoElement) return this.source.videoWidth;
    // VideoFrame is not available on all platforms (firefox)
    else if (globalThis.VideoFrame && this.source instanceof VideoFrame)
      return this.source.displayWidth;
    // @ts-ignore Error is for not checking VideoFrame, which we do above
    else return this.source.width;
  }
  private get sourceHeight(): number {
    if (!this.source) return 0;

    if (this.source instanceof HTMLVideoElement) return this.source.videoHeight;
    // VideoFrame is not available on all platforms (firefox)
    else if (globalThis.VideoFrame && this.source instanceof VideoFrame)
      return this.source.displayHeight;
    // @ts-ignore Error is for not checking VideoFrame, which we do above
    else return this.source.height;
  }
  private adjustCanvasSize() {
    this.canvas.width = this.sourceWidth * 2;
    this.canvas.height = this.sourceHeight * 2;
  }
}
