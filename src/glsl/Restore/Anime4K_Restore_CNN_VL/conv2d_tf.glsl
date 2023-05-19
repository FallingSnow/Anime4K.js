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

uniform sampler2D MAIN;
uniform vec2 u_resolution;
uniform vec2 u_texture_size;

varying vec2 v_texture_coord;

#define MAIN_pos (v_texture_coord)
#define MAIN_tex(pos) (texture2D(MAIN, pos))
#define MAIN_size (u_texture_size)
#define MAIN_pt (1.0 / MAIN_size)
#define MAIN_texOff(offset) (MAIN_tex(MAIN_pos + MAIN_pt * offset))

#define go_0(x_off, y_off) (MAIN_texOff(vec2(x_off, y_off)))
void main() {
  vec4 result = mat4(0.1690102, -0.2560719, 0.39658326, -0.3679659, -0.27616683, -0.35619372, -0.3748396, 0.08430813, -0.29574734, -0.31511316, -0.09773105, 0.13616018, 0.0, 0.0, 0.0, 0.0) * go_0(-1.0, -1.0);
  result += mat4(-0.1326393, -0.259433, 0.025070239, 0.58914864, -0.036478516, 0.30723435, 0.007458902, 0.012962684, 0.2493056, 0.13007334, -0.08448256, -0.38414413, 0.0, 0.0, 0.0, 0.0) * go_0(-1.0, 0.0);
  result += mat4(-0.11539356, 0.35253766, 0.26143202, 0.2760807, -0.09371543, -0.028165473, -0.028452158, -0.27050856, 0.06718067, -0.0056619495, -0.17654495, 0.17288211, 0.0, 0.0, 0.0, 0.0) * go_0(-1.0, 1.0);
  result += mat4(-0.16145481, -0.3204927, -0.54317135, 0.11830119, 0.49315026, 0.12008072, 0.50857407, -0.30382085, 0.25807253, 0.020755528, 0.29388228, 0.106109895, 0.0, 0.0, 0.0, 0.0) * go_0(0.0, -1.0);
  result += mat4(-0.22728722, 0.50484747, -0.07904469, 0.33114597, 0.50306976, -0.22760947, 0.14773269, 0.17628263, 0.14788547, -0.08223464, -0.10880935, -0.3151985, 0.0, 0.0, 0.0, 0.0) * go_0(0.0, 0.0);
  result += mat4(0.3414351, 0.057279214, -0.14419858, 0.09761111, -0.11794496, 0.021717256, -0.22750235, 0.13986664, -0.38932344, 0.28996095, 0.3773904, 0.13175532, 0.0, 0.0, 0.0, 0.0) * go_0(0.0, 1.0);
  result += mat4(0.1376552, -0.19587159, -0.35147396, -0.097646296, 0.1686707, -0.14385861, 0.031198, 0.12383533, -0.23089902, 0.08707301, 0.3362293, -0.100579016, 0.0, 0.0, 0.0, 0.0) * go_0(1.0, -1.0);
  result += mat4(-0.056774966, 0.047585852, -0.36395878, -0.20211312, 0.4077735, 0.12631284, 0.39813092, -0.033365678, 0.2307249, -0.09131807, 0.20823865, 0.31084216, 0.0, 0.0, 0.0, 0.0) * go_0(1.0, 0.0);
  result += mat4(-0.12456089, 0.09755632, 0.31490886, -0.06579996, -0.13386595, 0.07564795, -0.26605195, -0.075180635, -0.11182657, 0.06757017, -0.14351276, -0.16828312, 0.0, 0.0, 0.0, 0.0) * go_0(1.0, 1.0);
  result += vec4(-0.046043985, 0.055581126, -0.08791638, -0.13022089);
  gl_FragColor = result;
}
