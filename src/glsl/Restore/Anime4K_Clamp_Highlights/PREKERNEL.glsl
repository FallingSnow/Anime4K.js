// MIT License

// Copyright (c) 2019-2021 bloc97
// All rights reserved.

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

precision mediump float;

uniform sampler2D PREKERNEL;
uniform sampler2D STATSMAX;

uniform vec2 u_resolution;
uniform vec2 u_texture_size;

varying vec2 v_texture_coord;

#define PREKERNEL_pos (v_texture_coord)
#define PREKERNEL_tex(pos) (texture2D(PREKERNEL, pos))
#define PREKERNEL_size (u_texture_size)
#define PREKERNEL_pt (1.0 / PREKERNEL_size)
#define PREKERNEL_texOff(offset) (PREKERNEL_tex(PREKERNEL_pos + PREKERNEL_pt * offset))
#define STATSMAX_pos (v_texture_coord)
#define STATSMAX_tex(pos) (texture2D(STATSMAX, pos))
#define STATSMAX_size (u_texture_size)
#define STATSMAX_pt (1.0 / STATSMAX_size)
#define STATSMAX_texOff(offset) (STATSMAX_tex(STATSMAX_pos + STATSMAX_pt * offset))

float get_luma(vec4 rgba) {
  return dot(vec4(0.299, 0.587, 0.114, 0.0), rgba);
}

void main() {
	float current_luma = get_luma(PREKERNEL_tex(PREKERNEL_pos));
	float new_luma = min(current_luma, STATSMAX_tex(STATSMAX_pos).x);

  //This trick is only possible if the inverse Y->RGB matrix has 1 for every row... (which is the case for BT.709)
  //Otherwise we would need to convert RGB to YUV, modify Y then convert back to RGB.
  vec4 color = PREKERNEL_tex(PREKERNEL_pos);
  color.rgb -= (current_luma - new_luma);
  gl_FragColor = color;
}
