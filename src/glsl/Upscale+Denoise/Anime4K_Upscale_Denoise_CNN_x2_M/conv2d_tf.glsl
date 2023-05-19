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
  vec4 result = mat4(-0.029052526, 0.059789784, -0.024398074, 0.06907132, 0.18920785, -0.12923062, 0.0766382, -0.12048348, -0.017786544, 0.06251133, -0.068393864, 0.056690093, 0.0, 0.0, 0.0, 0.0) * go_0(-1.0, -1.0);
  result += mat4(0.14032267, -0.077691495, -0.009036259, -0.13049065, 0.20954624, 0.023231741, -0.2759354, 0.49927905, 0.039609738, -0.092625424, 0.09426452, -0.2246486, 0.0, 0.0, 0.0, 0.0) * go_0(-1.0, 0.0);
  result += mat4(-0.023119625, 0.046549924, 0.073033765, 0.03727065, 0.04498207, 0.024455868, 0.17602317, -0.3150503, 0.019985953, 0.03670126, 0.0071220254, 0.107966185, 0.0, 0.0, 0.0, 0.0) * go_0(-1.0, 1.0);
  result += mat4(0.111121014, -0.084099665, 0.12595509, -0.048271902, -0.007799661, 0.04831373, 0.11868961, 0.11607051, 0.05169621, -0.050569464, 0.120362274, 0.034607537, 0.0, 0.0, 0.0, 0.0) * go_0(0.0, -1.0);
  result += mat4(-0.41167754, -0.44940078, 0.35485214, 0.58048695, -1.0151424, -0.70137614, 0.38405335, 0.37337455, -0.096364655, -0.14538667, 0.17917591, 0.32259464, 0.0, 0.0, 0.0, 0.0) * go_0(0.0, 0.0);
  result += mat4(0.06378494, -0.040756933, -0.4773648, -0.47702238, 0.1803328, -0.21388084, -0.5509359, -0.6491179, -0.048081584, -0.0025129975, -0.28561604, -0.22229671, 0.0, 0.0, 0.0, 0.0) * go_0(0.0, 1.0);
  result += mat4(-0.037024107, 0.016497454, -0.05315267, -0.023392007, 0.1840294, 0.12675077, 0.037417043, -0.022394283, -0.028192522, -0.016344562, -0.07269005, -0.04747136, 0.0, 0.0, 0.0, 0.0) * go_0(1.0, -1.0);
  result += mat4(0.039480202, 0.5577544, -0.117326505, 0.06622856, -0.038784727, 0.65673745, -0.109742545, 0.22294083, 0.00038519394, 0.24552485, -0.07008514, 0.00029412706, 0.0, 0.0, 0.0, 0.0) * go_0(1.0, 0.0);
  result += mat4(-0.009279719, -0.031882852, 0.14124188, -0.0759899, -0.024016602, 0.15252088, 0.13614258, -0.09961189, 0.05446014, -0.03827061, 0.11210173, -0.028823104, 0.0, 0.0, 0.0, 0.0) * go_0(1.0, 1.0);
  result += vec4(0.012836382, -0.0062823873, -0.03165346, -0.0017501811);
  gl_FragColor = result;
}