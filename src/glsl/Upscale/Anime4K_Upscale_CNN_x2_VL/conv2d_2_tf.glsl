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

uniform sampler2D conv2d_1_tf;
uniform sampler2D conv2d_1_tf1;

uniform vec2 u_resolution;
uniform vec2 u_texture_size;

varying vec2 v_texture_coord;

#define conv2d_1_tf_pos (v_texture_coord)
#define conv2d_1_tf_tex(pos) (texture2D(conv2d_1_tf, pos))
#define conv2d_1_tf_size (u_texture_size)
#define conv2d_1_tf_pt (1.0 / conv2d_1_tf_size)
#define conv2d_1_tf_texOff(offset) (conv2d_1_tf_tex(conv2d_1_tf_pos + conv2d_1_tf_pt * offset))
#define conv2d_1_tf1_pos (v_texture_coord)
#define conv2d_1_tf1_tex(pos) (texture2D(conv2d_1_tf1, pos))
#define conv2d_1_tf1_size (u_texture_size)
#define conv2d_1_tf1_pt (1.0 / conv2d_1_tf1_size)
#define conv2d_1_tf1_texOff(offset) (conv2d_1_tf1_tex(conv2d_1_tf1_pos + conv2d_1_tf1_pt * offset))

#define go_0(x_off, y_off) (max((conv2d_1_tf_texOff(vec2(x_off, y_off))), 0.0))
#define go_1(x_off, y_off) (max((conv2d_1_tf1_texOff(vec2(x_off, y_off))), 0.0))
#define go_2(x_off, y_off) (max(-(conv2d_1_tf_texOff(vec2(x_off, y_off))), 0.0))
#define go_3(x_off, y_off) (max(-(conv2d_1_tf1_texOff(vec2(x_off, y_off))), 0.0))
void main() {
  vec4 result = mat4(0.13129333, -0.022117995, -0.009753253, 0.020439912, 0.044090994, -0.0916335, 0.0036765633, -0.11719207, -0.06413809, 0.04079378, -0.00085516454, -0.06306388, -0.12660664, -0.054126263, -0.005513979, 0.06364538) * go_0(-1.0, -1.0);
  result += mat4(-0.028422508, 0.23270117, -0.28674677, -0.10820166, 0.024321957, -0.0811145, -0.07290707, -0.02125165, -0.064260505, 0.052076746, -0.009654081, 0.08363882, -0.02037171, 0.15006389, 0.121593125, -0.011237004) * go_0(-1.0, 0.0);
  result += mat4(-0.14672333, 0.015381624, 0.1028172, -0.041823238, 0.0072677187, -0.042953942, 0.06426537, -0.0938381, -0.05990813, -0.04599802, -0.11264726, -0.027826328, -0.058160868, 0.10747306, -0.07327458, 0.07998872) * go_0(-1.0, 1.0);
  result += mat4(-0.08702181, -0.03750975, -0.045659006, 0.04488332, 0.09102003, 0.066556975, -0.04353586, 0.08994567, -0.13561495, -0.10653702, 0.006989605, 0.028230097, 0.07177144, 0.2938447, -0.00943923, 0.022120917) * go_0(0.0, -1.0);
  result += mat4(-0.1801194, -0.11119162, 0.1977298, -0.247902, -0.16654298, -0.07423158, 0.114130594, 0.0014401592, 0.006954727, -0.09810646, -0.051310766, 0.19487657, 0.2545855, -0.06328558, -0.04617056, 0.09444692) * go_0(0.0, 0.0);
  result += mat4(0.011378825, 0.16044368, 0.017211074, 0.14472178, 0.032992378, -0.008925819, 0.035120245, -0.012409223, 0.074333005, 0.1178002, -0.128956, -0.13624239, -0.2791275, 0.21457297, -0.1476131, 0.04874687) * go_0(0.0, 1.0);
  result += mat4(-0.03491764, -0.061763793, 0.05779039, 0.0054837577, -0.023937583, 0.08281698, 0.032306053, -0.014566218, 0.12738499, -0.0132100545, -0.051833414, 0.0057818824, 0.012158851, -0.20231532, -0.0043795826, 0.10285843) * go_0(1.0, -1.0);
  result += mat4(-0.22269921, -0.15135509, -0.039143335, 0.033390045, 0.06770212, -0.14538582, -0.08011057, 0.03796648, -0.025913516, 0.13925864, 0.18309896, 0.012709204, -0.24912506, 0.3217706, 0.0394195, 0.017977878) * go_0(1.0, 0.0);
  result += mat4(0.00080196525, 0.059145816, 0.05720508, 0.0056548906, 0.005168018, 0.09938438, 0.0200503, -0.05516137, 0.061309986, -0.019621318, -0.1541441, 0.019540716, 0.030571707, -0.09054893, 0.032851614, -0.27210873) * go_0(1.0, 1.0);
  result += mat4(0.27061436, -0.114008114, -0.0020118617, -0.1656827, 0.09770587, 0.029897455, -0.03307522, -0.04661818, 0.033011347, 0.18498488, -0.05162084, 0.087471776, -0.24665618, -0.12538423, -0.08123797, -0.010210389) * go_1(-1.0, -1.0);
  result += mat4(0.075188264, 0.0020608555, 0.18558815, 0.041179713, 0.11232638, 0.05507779, -0.19599183, 0.027942855, 0.06199144, 0.22141005, -0.06121163, 0.014993597, 0.24105869, -0.019737717, -0.112485714, 0.0157406) * go_1(-1.0, 0.0);
  result += mat4(0.09425698, 0.0207658, 0.12074599, 0.009430481, 0.11889248, -0.025782838, 0.0034711843, 0.05113582, 0.012531833, -0.0018606635, -0.09137569, 0.018120576, 0.4051155, 0.02222076, -0.16001017, 0.10981527) * go_1(-1.0, 1.0);
  result += mat4(-0.03582557, 0.014994796, -6.4688604e-05, 0.24618183, -0.11697727, 0.24388117, 0.038502026, -0.3511993, 0.101741396, -0.10748137, 0.035059888, -0.017535849, 0.09450039, 0.06541661, 0.12149035, 0.28798738) * go_1(0.0, -1.0);
  result += mat4(-0.27143848, 0.017990451, -0.69144464, 0.037944376, -0.04551905, 0.09263134, 0.4259611, -0.14107811, -0.10641847, 0.23065196, 0.040813655, -0.07789163, 0.3087666, 0.08190437, 0.16409059, -0.06455426) * go_1(0.0, 0.0);
  result += mat4(-0.08290655, -0.35286915, -0.18082355, -0.32229406, 0.1608227, 0.030915622, 0.09207708, 0.02655054, 0.039464593, 0.026095424, 0.052584656, 0.033881903, -0.01751319, -0.0011676399, 0.04002607, 0.1630013) * go_1(0.0, 1.0);
  result += mat4(-0.012021132, 0.12163766, -0.07410629, -0.06879096, 0.017859738, -0.039261997, -0.028677614, -0.23610398, -0.15963873, -0.0006119958, 0.11275506, 0.0082659265, 0.05677582, 0.08676638, -0.08669759, -0.10475464) * go_1(1.0, -1.0);
  result += mat4(0.12792721, 0.06888765, 0.31803077, 0.26002547, -0.067599155, -0.011822328, -0.2589909, -0.30024147, 0.11076704, 0.15200609, -0.018180368, -0.19146141, 0.22298847, 0.059484895, 0.034478076, 0.15610938) * go_1(1.0, 0.0);
  result += mat4(0.0870121, -0.016420847, -0.011579898, 0.097182855, -0.120095566, -0.06843338, -0.043460473, -0.060684606, -0.027540063, -0.008499213, 0.033570655, -0.06866259, 0.01429712, -0.07424434, 0.0009466247, 0.09142678) * go_1(1.0, 1.0);
  result += mat4(-0.03781424, 0.04587032, 0.03744051, 0.02712279, -0.051038064, 0.0669144, -0.02640278, 0.12384894, -0.0022533627, -0.010022036, 0.07536463, -0.030489929, 0.09418577, 0.155089, -0.011290433, -0.02102941) * go_2(-1.0, -1.0);
  result += mat4(-0.0053278613, -0.07160643, 0.039028414, 0.04123311, -0.10693177, -0.1170874, 0.07230816, -0.033255517, -0.119176835, 0.0786526, -0.11880206, -0.11354601, -0.037539184, 0.14404313, 0.069760695, 0.024738638) * go_2(-1.0, 0.0);
  result += mat4(0.03413808, -0.006487654, 0.10006853, 0.22228058, -0.13796462, -0.14042488, 0.04017443, -0.031790894, -0.06673143, 0.009888688, 0.08831443, -0.0045771743, -0.028375361, -0.04704813, 0.07128581, -0.07012518) * go_2(-1.0, 1.0);
  result += mat4(-0.06954315, -0.23728988, -0.14192343, -0.08236467, -0.2552115, 0.04102959, -0.06355397, -0.08340241, 0.17617856, 0.20281969, -0.16249381, 0.10843737, -0.04392261, -0.08587206, 0.053069845, -0.15482199) * go_2(0.0, -1.0);
  result += mat4(0.124981806, 0.12828638, -0.061472785, -0.20108232, -0.14905351, -0.40766275, -0.35427195, -0.13183996, 0.09307428, -0.07697028, 0.06702549, -0.22656697, 0.019868268, -0.19361132, 0.08784669, 0.20249842) * go_2(0.0, 0.0);
  result += mat4(-0.004661343, -0.09333453, -0.24876262, -0.07906779, 0.110697776, -0.37069768, -0.042212646, -0.0046135853, -0.2254257, -0.023392014, 0.031476703, -0.045574382, -0.12675518, -0.076056994, -0.08228006, -0.040303517) * go_2(0.0, 1.0);
  result += mat4(0.16182694, 0.0512523, 0.051189836, 0.048962783, -0.05156489, -0.17987493, -0.012037288, 0.06953726, -0.09458492, 0.1610021, -0.004063283, -0.032922342, 0.08995396, 0.1939926, -0.018710036, -0.08153231) * go_2(1.0, -1.0);
  result += mat4(-0.064830944, 0.06121252, -0.18886387, -0.12976822, -0.031117212, 0.12219633, 0.19070715, 0.12495262, -0.11994464, -0.24687837, -0.08425294, -0.016920334, -0.13286817, -0.3260188, -0.11776061, 0.1651019) * go_2(1.0, 0.0);
  result += mat4(-0.17652592, 0.002499805, -0.030541016, -0.01393431, 0.031418208, 0.08209422, 0.12430871, 0.4387016, -0.108871914, -0.09041422, 0.031226631, -0.1638517, 0.20756467, 0.014476537, -0.012701195, -0.03440563) * go_2(1.0, 1.0);
  result += mat4(0.005320072, -0.0032291536, -0.017209187, 0.031944863, -0.2479921, -0.24433962, -0.13832912, 0.07835928, -0.17707248, 0.028202811, -0.19121435, 0.164587, 0.123152815, 0.0050288937, 0.084104605, -0.0380019) * go_3(-1.0, -1.0);
  result += mat4(0.16008669, -0.018608516, -0.013778938, 0.033447385, -0.01242472, -0.070916265, 0.026909694, -0.07318777, 0.15158044, 0.12047607, -0.1709358, 0.2031767, 0.0025611701, -0.21457459, 0.2791286, 0.10159932) * go_3(-1.0, 0.0);
  result += mat4(0.14320926, 0.020023825, -0.0484187, 0.011563084, -0.2640472, -0.013056275, 0.004234292, -0.095376395, 0.28363484, -0.0058227647, -0.0777649, 0.05238444, 0.41757923, -0.07081097, 0.012567031, -0.13029522) * go_3(-1.0, 1.0);
  result += mat4(0.07266207, 0.042793367, -0.08212271, -0.23401663, -0.19457819, 0.4191269, -0.03095442, 0.15339781, -0.28451788, 0.09316364, 0.10231693, -0.22844811, 0.111623526, 0.120017685, 0.18777381, 0.014420896) * go_3(0.0, -1.0);
  result += mat4(0.15037206, -0.29763284, 0.2601235, 0.0193363, 0.13686465, 0.009907918, -0.37781665, 0.04916627, 0.14114739, 0.5043813, 0.0447959, -0.029427614, 0.041768756, 0.27211213, 0.14163221, 0.086162075) * go_3(0.0, 0.0);
  result += mat4(0.19159287, 0.21363218, 0.15053211, 0.08992885, 0.100828275, 0.09379921, 0.030783929, 0.11664482, -0.059145752, -0.19400764, -0.09351283, -0.016430443, -0.12910964, -0.067078374, 0.11760082, 0.121194765) * go_3(0.0, 1.0);
  result += mat4(-0.055059325, 0.09299572, 0.06848913, 0.06334532, -0.1476285, 0.111801244, -0.033960916, 0.06474366, -0.04952303, 0.27885208, -0.052447475, 0.09226763, -0.15024844, -0.0033919013, 0.013498364, 0.09135676) * go_3(1.0, -1.0);
  result += mat4(-0.017010042, -0.122343406, -0.19097193, -0.27957183, -0.18206005, 0.102321096, 0.22794476, 0.0439245, -0.23710132, -0.08070259, 0.17377135, 0.23811814, 0.17799385, 0.049567625, 0.1470908, 0.07329385) * go_3(1.0, 0.0);
  result += mat4(0.0038071256, 0.19454515, -0.01222965, -0.07390379, -0.0532754, 0.03942833, 0.123840906, 0.023459576, -0.0658742, -0.023957543, -0.14682837, 0.1221027, -0.010986398, -0.066184506, 0.03026491, -0.0638446) * go_3(1.0, 1.0);
  result += vec4(-0.06427697, -0.00039365015, 0.011889719, 0.060232002);
  gl_FragColor = result;
}
