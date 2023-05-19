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
  vec4 result = mat4(-0.15485518, -0.29363206, -0.22610365, -0.14291525, -0.45240572, -0.18319772, -0.12209436, 0.15031648, 0.09878383, 0.06711082, 0.25763842, -0.084633484, 0.0, 0.0, 0.0, 0.0) * go_0(-1.0, -1.0);
  result += mat4(-0.10204406, 0.16167697, 0.22371867, -0.37947702, -0.24476196, -0.038824454, 0.060157117, 0.15764871, -0.08072927, -0.2210841, -0.31835055, 0.009979876, 0.0, 0.0, 0.0, 0.0) * go_0(-1.0, 0.0);
  result += mat4(0.20506924, 0.21132155, -0.0922578, -0.07430473, 0.14529926, 0.20549752, 0.0077948375, 0.13246094, -0.32353187, 0.21074104, 0.092629515, 0.17590871, 0.0, 0.0, 0.0, 0.0) * go_0(-1.0, 1.0);
  result += mat4(0.04125819, -0.44050243, 0.23729716, 0.3218237, 0.12943116, -0.011674174, 0.10390632, 0.027775545, -0.20308031, -0.16904089, -0.2121676, -0.022515794, 0.0, 0.0, 0.0, 0.0) * go_0(0.0, -1.0);
  result += mat4(0.09664124, 0.20127031, 0.60345304, 0.16697013, 0.23093723, -0.38116834, 0.109695725, 0.0007595324, 0.4092646, 0.009624758, 0.11229678, 0.25326383, 0.0, 0.0, 0.0, 0.0) * go_0(0.0, 0.0);
  result += mat4(0.014879592, 0.19204311, 0.07102085, -0.7312604, 0.34860876, 0.3429918, -0.027331594, 0.27636307, 0.1342437, 0.107820466, -0.12645108, 0.21081445, 0.0, 0.0, 0.0, 0.0) * go_0(0.0, 1.0);
  result += mat4(-0.12687613, -0.09247973, -0.25973785, 0.4350873, -0.18987224, 0.028678741, -0.0903819, -0.63974863, 0.205591, 0.11308998, 0.18458389, -0.4149041, 0.0, 0.0, 0.0, 0.0) * go_0(1.0, -1.0);
  result += mat4(0.34691808, -0.025498383, 0.3428986, 0.21663484, 0.23404741, -0.1725327, -0.0036315925, -0.13299675, -0.1873967, 0.031331502, -0.08785591, -0.0013278709, 0.0, 0.0, 0.0, 0.0) * go_0(1.0, 0.0);
  result += mat4(-0.35846514, 0.048703704, -0.104165934, 0.16529736, -0.15378916, 0.26030356, -0.07134151, 0.03692383, -0.15807101, -0.18885155, 0.044707954, -0.11444462, 0.0, 0.0, 0.0, 0.0) * go_0(1.0, 1.0);
  result += vec4(-0.0022791293, -0.024132347, -0.57621074, 0.028573977);
  gl_FragColor = result;
}
