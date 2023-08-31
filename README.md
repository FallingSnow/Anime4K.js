# Anime4K.js

A WebGL port of [Anime4K](https://github.com/bloc97/Anime4K) (4.0.1) glsl filter

## Feature

* Anime4K Upscaler in WebGL

## Build
### Preparing

```sh
git clone https://github.com/monyone/Anime4K.js
cd Anime4K.js
yarn
```

## Compile

```sh
yarn build
```

## Getting Start

### Image Upscale

```javascript
const upscaler = new Anime4KJS.ImageUpscaler(Anime4KJS.ANIME4KJS_SIMPLE_M_2X /* PROFILE */);
upscaler.attachSource(textureSource, canvasElement);
upscaler.upscale(); // do upscale
```

### Video Upscale

```javascript
const upscaler = new Anime4KJS.VideoUpscaler(30 /* TARGET FPS */, Anime4KJS.ANIME4KJS_SIMPLE_M_2X /* PROFILE */);
upscaler.attachVideo(videoElement, canvasElement);
upscaler.start(); // start upscale
```

## Examples
Some GL operations require a CORS context and cannot be run from a local file. So you can run a local web server using the command below.

```javascript
yarn run examples
```

### Image Upscale

Open [http://127.0.0.1:8080/examples/image.html](http://127.0.0.1:8080/examples/image.html)

## Credits

* [Anime4K](https://github.com/bloc97/Anime4K) by [bloc97](https://github.com/bloc97)