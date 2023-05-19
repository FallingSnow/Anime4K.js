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

uniform sampler2D conv2d_4_tf;
uniform sampler2D conv2d_4_tf1;

uniform vec2 u_resolution;
uniform vec2 u_texture_size;

varying vec2 v_texture_coord;

#define conv2d_4_tf_pos (v_texture_coord)
#define conv2d_4_tf_tex(pos) (texture2D(conv2d_4_tf, pos))
#define conv2d_4_tf_size (u_texture_size)
#define conv2d_4_tf_pt (1.0 / conv2d_4_tf_size)
#define conv2d_4_tf_texOff(offset) (conv2d_4_tf_tex(conv2d_4_tf_pos + conv2d_4_tf_pt * offset))
#define conv2d_4_tf1_pos (v_texture_coord)
#define conv2d_4_tf1_tex(pos) (texture2D(conv2d_4_tf1, pos))
#define conv2d_4_tf1_size (u_texture_size)
#define conv2d_4_tf1_pt (1.0 / conv2d_4_tf1_size)
#define conv2d_4_tf1_texOff(offset) (conv2d_4_tf1_tex(conv2d_4_tf1_pos + conv2d_4_tf1_pt * offset))

#define go_0(x_off, y_off) (max((conv2d_4_tf_texOff(vec2(x_off, y_off))), 0.0))
#define go_1(x_off, y_off) (max((conv2d_4_tf1_texOff(vec2(x_off, y_off))), 0.0))
#define go_2(x_off, y_off) (max(-(conv2d_4_tf_texOff(vec2(x_off, y_off))), 0.0))
#define go_3(x_off, y_off) (max(-(conv2d_4_tf1_texOff(vec2(x_off, y_off))), 0.0))
void main() {
  vec4 result = mat4(0.018134737, -0.2296755, -0.07276725, -0.029795367, 0.05382051, 0.092847414, -0.024469728, -0.1674685, 0.0017946451, 0.30074653, 0.0034195695, -0.04892261, 0.18229689, -0.20116119, -0.12702174, -0.08259108) * go_0(-1.0, -1.0);
  result += mat4(-0.1357695, -0.08149211, 0.09314453, -0.21966846, 0.34740716, 0.043606415, 0.04225903, 0.034449834, 0.17248215, 0.39148283, -0.13868807, -0.010550686, 0.044238456, -0.09693464, -0.005044985, 0.24383289) * go_0(-1.0, 0.0);
  result += mat4(0.19959371, 0.098685324, 0.058746945, 0.010580748, 0.08051514, 0.031898864, 0.017556064, 0.13004355, -0.01727653, 0.11044019, 0.040673427, -0.20064595, -0.23321067, 0.06398686, -0.19126236, -0.2430858) * go_0(-1.0, 1.0);
  result += mat4(-0.12870286, -0.113455534, 0.23722827, 0.070718594, 0.19049989, -0.1927299, -0.06343845, 0.113127775, 0.082530305, -0.10972526, -0.090779535, 0.05731582, 0.11018802, -0.18049154, 0.09269507, -0.10304576) * go_0(0.0, -1.0);
  result += mat4(0.15513484, 0.06659583, 0.08125296, -0.012350324, -0.09492788, 0.5048303, 0.13206847, 0.39554298, 0.28953737, -0.20913891, -0.26781562, -0.17539899, 0.023778774, 0.29716817, 0.15768486, 0.37702608) * go_0(0.0, 0.0);
  result += mat4(0.0724462, 0.015571356, -0.032217246, 0.0050658924, -0.22708446, 0.03968809, 0.016753826, 0.0025668752, -0.055932112, 0.113931604, 0.19766758, -0.030027265, -0.17384295, 0.15013468, -0.0070017707, -0.09469028) * go_0(0.0, 1.0);
  result += mat4(-0.078361556, -0.0954201, -0.006358101, 0.040500037, 0.4190454, -0.17622913, -0.07234791, 0.05462559, 0.18641087, 0.058313597, -0.0180785, 0.13818781, -0.14640772, 0.0699486, 0.0073663946, -0.076789856) * go_0(1.0, -1.0);
  result += mat4(-0.21421191, 0.08736062, 0.09041226, 0.03608585, 0.02769972, 0.09641289, 0.11824623, 0.05653645, 0.16464607, 0.19839554, -0.13379547, 0.054417104, 0.067530684, 0.18971571, 0.13785432, -0.097639814) * go_0(1.0, 0.0);
  result += mat4(-0.32658005, -0.14606023, -0.069448665, 0.032998275, -0.28331423, 0.0011900732, -0.020304207, -0.13535896, 0.08298347, 0.045509677, -0.030503955, -0.037504148, 0.049955815, 0.0925771, 0.00058534974, -0.12398032) * go_0(1.0, 1.0);
  result += mat4(-0.2955836, 0.29059318, -0.018196672, -0.35866606, -0.01309431, 0.03540315, 0.010609202, 0.11956812, 0.10296229, 0.22536302, 0.015201129, -0.23797737, -0.16960852, -0.11414787, -0.034440614, 0.112644605) * go_1(-1.0, -1.0);
  result += mat4(-0.14952518, 0.07024436, -0.083184876, -0.0814617, -0.13303639, 0.016159372, -0.13521518, 0.2221334, -0.056617837, 0.12958299, 0.064461656, -0.20146395, -0.16023181, 0.2640758, 0.27528805, -0.1426518) * go_1(-1.0, 0.0);
  result += mat4(-0.04382363, 0.09856003, -0.08561442, -0.15699928, -0.121069774, 0.04685383, -0.009170197, -0.031489655, 0.18730178, 0.238442, 0.22497098, 0.032015145, -0.03709115, 0.1535079, 0.21674158, 0.10678019) * go_1(-1.0, 1.0);
  result += mat4(-0.12200952, 0.24224263, 0.034097504, -0.028179523, -0.011962496, -0.04489487, -0.05198827, 0.22194928, -0.045400873, -0.049828544, 0.111477956, -0.098361604, 0.12788995, -0.016093334, -0.19886433, -0.011161484) * go_1(0.0, -1.0);
  result += mat4(0.30563712, 0.013071727, -0.004799883, 0.12888052, -0.259498, -0.041566677, 0.07311124, 0.162324, 0.28371668, -0.004693743, -0.0019395344, 0.029358242, 0.08730285, 0.12184509, 0.05508437, 0.048439097) * go_1(0.0, 0.0);
  result += mat4(0.12760857, 0.115813166, -0.217695, -0.10629871, -0.227366, 0.09030426, -0.15313712, 0.020528946, -0.20743734, 0.088583544, 0.04594053, -0.22891994, 0.18949282, -0.042186577, -0.17330512, -0.010711361) * go_1(0.0, 1.0);
  result += mat4(0.029503195, 0.0063797613, -0.17004286, -0.096844055, 0.010218098, 0.04247233, 0.02362808, 0.14700809, -0.08082364, 0.11159672, -0.018505255, -0.15228583, 0.15693732, -0.025359154, 0.024829186, 0.1943192) * go_1(1.0, -1.0);
  result += mat4(-0.03912932, -0.21989027, 0.12203028, 0.18702275, -0.118537985, 0.21039696, 0.09102061, 0.012288879, 0.031666897, 0.1318455, -0.04901404, -0.07516063, -0.44782668, 0.04884501, 0.047070876, 0.008728358) * go_1(1.0, 0.0);
  result += mat4(-0.08669101, 0.3053463, -0.08963947, 0.0034188698, -0.070004664, 0.064788476, 0.093737036, 0.070050925, 0.12728429, -0.13179256, -0.014913502, 0.09308136, -0.027638942, 0.008638711, 0.08794172, -0.05531093) * go_1(1.0, 1.0);
  result += mat4(0.0728421, 0.07872358, 0.11454748, 0.08497922, 0.071820416, -0.11789207, -0.08184197, 0.1359588, -0.2143346, -0.05876081, 0.023172129, -0.08430511, -0.19276723, 0.14283359, 0.15604696, -0.055187486) * go_2(-1.0, -1.0);
  result += mat4(0.068641685, 0.2732106, -0.2809107, 0.12736696, -0.08642367, 0.023898933, -0.17859498, -0.18299665, -0.06684587, -0.12204666, 0.45898953, -0.24240111, 0.25182098, -0.04395751, 0.10637211, -0.22135144) * go_2(-1.0, 0.0);
  result += mat4(0.0852072, 0.051133018, 0.03333165, -0.0008938216, 0.10251267, 0.0550774, 0.041769378, -0.21259712, 0.286912, 0.123342015, 0.282759, -0.0730124, 0.14275575, -0.15580742, -0.15224406, 0.045376908) * go_2(-1.0, 1.0);
  result += mat4(0.03328225, 0.11563978, -0.07451964, 0.030546209, -0.04698351, -0.18544962, 0.037350416, 0.13969816, 0.0556746, -0.06359919, 0.06478219, -0.031694926, 0.13396506, 0.09443612, -0.01922686, -0.06290365) * go_2(0.0, -1.0);
  result += mat4(0.07495407, 0.063429266, -0.106221214, -0.085107304, 0.2497817, -0.46598253, -0.18833177, -0.2731128, -0.13024822, 0.56053543, 0.055704467, -0.12331414, -0.031199086, 0.05061188, 0.22097112, -0.6611177) * go_2(0.0, 0.0);
  result += mat4(0.08276988, -0.044184342, -0.03562185, -0.06159881, 0.27694225, -0.07192965, -0.08663714, 0.020221777, 0.14095962, -0.06229397, 0.051374253, -0.038158998, 0.10664802, -0.041305423, 0.051260717, -0.054698635) * go_2(0.0, 1.0);
  result += mat4(0.12800686, 0.03485072, 0.039914366, 0.034041498, -0.08305794, -0.046292894, 0.22765331, 0.10904922, 0.0013937047, -0.08750301, 0.009126207, -0.065589435, 0.2837707, 0.08884436, -0.07234862, -0.093502745) * go_2(1.0, -1.0);
  result += mat4(0.113439895, 0.06081726, 0.1122302, -0.022936966, 0.10329637, -0.31816107, -0.051597945, 0.23846027, -0.083913095, -0.29872265, -0.040147282, -0.08981918, -0.04329814, -0.12339693, -0.034489952, 0.013393211) * go_2(1.0, 0.0);
  result += mat4(0.33091688, 0.1726297, 0.034332044, -0.091396205, 0.15434311, -0.0022870845, -0.15506189, 0.08710491, -0.16063525, 0.042252056, 0.017086457, 0.08134797, 0.08631321, 0.037843138, 0.088296555, 0.0064518084) * go_2(1.0, 1.0);
  result += mat4(0.09161051, 0.114355795, -0.15304486, -0.030537153, 0.1835368, -0.3287635, 0.031197926, 0.09717476, 0.04276852, 0.113250345, 0.05949038, -0.10599563, 0.43574792, -0.060788117, 0.18409383, 0.12678055) * go_3(-1.0, -1.0);
  result += mat4(-0.018356865, -0.0072578182, 0.12020777, -0.013127592, 0.20136636, -0.22984362, 0.06896224, 0.00044982752, 0.008428429, -0.123316936, -0.09989286, 0.078248784, -0.16313677, -0.003020313, -0.46285018, -0.08967125) * go_3(-1.0, 0.0);
  result += mat4(-0.03451497, -0.10864502, 0.13207638, 0.17194521, 0.0037514758, -0.20222199, -0.12535086, 0.001511977, 0.056294486, -0.2112898, 0.078261316, 0.10118746, -0.044742294, 0.21793383, -0.19927903, -0.21338293) * go_3(-1.0, 1.0);
  result += mat4(-0.034903776, -0.10167085, 0.031066334, 0.0379958, 0.20532596, -0.17457838, 0.16556816, -0.0021619152, 0.02682665, 0.03396325, -0.059273884, 0.1922813, -0.072151475, -0.010240544, 0.2302027, 0.12385962) * go_3(0.0, -1.0);
  result += mat4(-0.20170145, -0.08203941, -0.028107846, -0.18003726, 0.44744352, -0.13190243, 0.13233365, 0.03626546, 0.085763134, -0.25613126, -0.11213388, 0.15529087, -0.271649, 0.050587676, -0.062583975, 0.057289865) * go_3(0.0, 0.0);
  result += mat4(-0.040649455, -0.17949733, 0.35847965, -0.040587306, 0.24314344, -0.23811667, 0.13958354, 0.04961874, 0.09858903, -0.04202913, -0.21850993, 0.0700419, -0.09130745, -0.096835814, 0.0022782686, -0.25416258) * go_3(0.0, 1.0);
  result += mat4(-0.08215545, -0.019647893, 0.055263475, 0.053733055, 0.098485716, -0.1041945, -0.06541415, -0.08868577, -0.07262986, 0.03513784, -0.110529095, -0.03369232, 0.056786604, 0.2569229, -0.05931065, -0.22081214) * go_3(1.0, -1.0);
  result += mat4(0.066926084, 0.029664058, -0.10779271, 0.11026963, 0.23927264, -0.16914488, 0.022947345, 0.12303853, -0.07066212, -0.013205378, 0.15348643, 0.035568032, 0.20966691, 0.010149819, -0.08814468, -0.064854674) * go_3(1.0, 0.0);
  result += mat4(0.11493852, -0.074924305, -0.14840698, -0.16956823, 0.056806292, -0.06387947, -0.06880271, -0.04637334, -0.1929893, 0.18226422, 0.064644486, -0.1594863, 0.027403917, 0.13951495, -0.06569123, -0.07700207) * go_3(1.0, 1.0);
  result += vec4(-0.043347504, -0.20504741, -0.037821215, -0.014486937);
  gl_FragColor = result;
}
