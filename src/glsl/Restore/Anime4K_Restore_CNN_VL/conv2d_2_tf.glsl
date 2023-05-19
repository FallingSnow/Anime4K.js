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
  vec4 result = mat4(-0.069641694, 0.104958326, 0.14786446, 0.027633663, -0.004279524, -0.020451711, 0.0883571, -0.016224537, 0.13585235, 0.11078269, 0.20198658, -0.042161036, 0.020466218, 0.20994963, 0.20072585, -0.028024657) * go_0(-1.0, -1.0);
  result += mat4(0.050872434, 0.12874635, 0.1298729, 0.115810685, 0.07087254, 0.09885682, 0.23018982, 0.19187538, 0.10953604, 0.0033836907, -0.13325337, 0.09830315, -0.06528767, 0.05096927, -0.016355392, -0.039334368) * go_0(-1.0, 0.0);
  result += mat4(0.027010268, 0.018263958, 0.0360758, 0.016791478, 0.2815702, 0.15517488, 0.43415815, 0.044976447, -0.0070842914, -0.12546758, 0.16874593, 0.077622116, 0.02252915, 0.1769774, 0.07181055, -0.15128697) * go_0(-1.0, 1.0);
  result += mat4(0.057129618, 0.118046716, 0.07237424, -0.07842637, -0.044214778, -0.12886304, 0.08603301, -0.10416606, -0.15852053, 0.3788151, 0.26181692, -0.09092249, 0.31635332, 0.064212754, 0.21923725, 0.07500004) * go_0(0.0, -1.0);
  result += mat4(-0.16981383, 0.044409662, -0.3717617, -0.031610407, 0.03658662, -0.09459229, -0.09449437, -0.014000666, -0.19656453, 0.03934163, -0.16304104, -0.12761801, -0.06235523, 0.16438273, -0.036933117, -0.095564745) * go_0(0.0, 0.0);
  result += mat4(0.09725091, 0.034022827, 0.17699842, 0.1079676, -0.13236652, 0.03718181, -0.06968635, -0.23288171, 0.10275666, 0.08464966, -0.37162134, -0.35782215, -0.11023659, 0.2519236, -0.035197742, -0.019324787) * go_0(0.0, 1.0);
  result += mat4(-0.09968464, 0.01102193, 0.0073735216, 0.011999313, -0.004998707, 0.09518938, 0.045727003, -0.21544908, 0.006879454, -0.06398254, -0.12584935, -0.06759933, -0.0820037, -0.07775104, 0.021957919, -0.122708224) * go_0(1.0, -1.0);
  result += mat4(-0.08869767, 0.031296413, -0.0034280645, 0.13778855, 0.10073061, -0.08393937, -0.032959275, -0.0500518, 0.010908757, -0.09189417, -0.057760105, 0.17652664, -0.08729078, -0.09639096, -0.25654703, 0.055152636) * go_0(1.0, 0.0);
  result += mat4(0.0027847723, -0.12885433, 0.038065907, 0.17450769, 0.0864409, 0.04592345, -0.015443841, 0.077010944, 0.08967368, 0.06800111, -0.23636387, 0.35023567, 0.03165923, 0.03132063, 0.17964344, 0.035610788) * go_0(1.0, 1.0);
  result += mat4(-0.032017227, -0.0022808525, -0.08470573, 0.05332408, -0.14674746, 0.025374275, -0.018281924, 0.041163016, 0.00096549373, 0.014724006, 0.004913065, 0.18494442, 0.034953076, -0.15731992, -0.13792977, 0.08041999) * go_1(-1.0, -1.0);
  result += mat4(0.08305006, 8.6318905e-05, -0.007895379, 0.02731387, -0.061324496, 0.050034665, 0.22662131, -0.013876427, -0.074468784, -0.008136604, -0.23337875, -0.1742574, 0.011753501, -0.11666686, -0.22541048, -0.14549944) * go_1(-1.0, 0.0);
  result += mat4(-0.028333234, 0.121047184, 0.06720256, -0.058930036, 0.030258363, 0.07292774, 0.06455556, 0.0019076486, 0.0073987027, 0.17144889, 0.06084024, -0.08762086, -0.114422195, -0.16595861, -0.08706028, -0.10736261) * go_1(-1.0, 1.0);
  result += mat4(-0.02519315, -0.14611271, 0.0388848, 0.19481422, -0.05970354, -0.08391417, 0.18982239, -0.10447052, 0.15587378, -0.023997072, 0.0781739, 0.2182389, -0.023886079, -0.1422596, -0.13352804, 0.005008043) * go_1(0.0, -1.0);
  result += mat4(0.08842712, -0.100292705, 0.18925671, 0.12198875, 0.061771665, -0.04473232, 0.025053164, 0.039047796, -0.1672479, -0.08934517, 0.33099812, -0.20269585, -0.21640155, -0.22029749, 0.16539703, -0.2442679) * go_1(0.0, 0.0);
  result += mat4(-0.16332205, -0.101898365, 0.02919932, -0.11900455, 0.14442924, 0.0916815, 0.037550304, 0.024123482, 0.02042624, 0.033472955, -0.059437107, -0.18735693, -0.013749093, -0.06199881, -0.08685079, 0.04252364) * go_1(0.0, 1.0);
  result += mat4(-0.09047013, -0.055188328, -0.09106191, -0.048969727, 0.05114009, -0.12753403, 0.07116141, 0.060749624, -0.074034564, -0.21952136, -0.09479503, 0.2753584, -0.014141759, -0.14883812, -0.0673838, -0.012279045) * go_1(1.0, -1.0);
  result += mat4(0.013816464, -0.0747162, -0.19202435, -0.064403646, 0.34980014, 0.04375546, 0.20264609, 0.006684355, 0.11523799, 0.024674915, -0.08697566, -0.04662527, -0.12743855, -0.39463726, 0.0057380227, 0.01286557) * go_1(1.0, 0.0);
  result += mat4(-0.08146522, 0.074080914, -0.16856177, -0.183158, 0.19228102, 0.12373886, 0.017574452, -0.01753772, 0.045071773, 0.07725093, 0.023422163, -0.011545186, 0.20751388, -0.10795588, 0.07606346, 0.10282933) * go_1(1.0, 1.0);
  result += mat4(0.12512013, -0.102208994, -0.09125398, 0.12043188, -0.066011876, 0.08831903, -0.017038671, -0.005541508, -0.049607087, 0.08654939, -0.02037085, 0.26887566, 0.005012545, 0.01869507, -0.013064982, -0.010649147) * go_2(-1.0, -1.0);
  result += mat4(0.006824864, -0.05071593, -0.20786697, -0.07327317, 0.011382597, 0.030494886, -0.04754353, -0.018284699, 0.01305972, -0.036589053, 0.26637617, 0.021887446, -0.026669119, -0.037982125, -0.063445956, -0.009104248) * go_2(-1.0, 0.0);
  result += mat4(0.032602567, 0.07094331, 0.052653246, 0.08342047, -0.085082285, -0.14674088, -0.23073354, -0.07915851, 0.0017120204, 0.032407638, -0.039819505, 0.16942178, 0.023192152, -0.0353237, 0.10930186, 0.22939779) * go_2(-1.0, 1.0);
  result += mat4(0.0010455973, -0.11821993, -0.12639599, 0.12250084, -0.12756817, 0.11478416, -0.1862587, 0.016819192, 0.02110181, -0.25492984, -0.1766048, 0.22188173, -0.21305011, 0.113442205, 0.04599144, -0.15840286) * go_2(0.0, -1.0);
  result += mat4(-0.15086032, -0.17428935, 0.39080557, 0.07576757, 0.121703945, 0.17944208, -0.003140103, -0.11231332, 0.12102969, 0.15310267, 0.17578171, 0.40631834, -0.21299168, 0.024928993, 0.030104794, 0.020753227) * go_2(0.0, 0.0);
  result += mat4(-0.098734386, -0.020072265, -0.14308836, -0.08490801, 0.017175158, 0.02250534, 0.04060829, 0.033022214, 0.0046218676, 0.17923212, 0.0112105915, 0.09574084, 0.14819936, -0.14692923, 0.12634254, 0.060762513) * go_2(0.0, 1.0);
  result += mat4(0.030521613, -0.097913325, -0.016720278, 0.11273997, 0.013019863, -0.06557118, 0.0405774, 0.0915019, 0.022414956, -0.053254984, 0.18639986, 0.07820968, 0.06498986, 0.058922634, -0.02240318, -0.086019725) * go_2(1.0, -1.0);
  result += mat4(0.2058775, 0.01502064, 0.05847032, 0.007249146, 0.086483665, 0.19420148, 0.03892261, -0.013546935, -0.07980237, 0.04347281, -0.10376214, -0.1366535, 0.05285337, 0.07213318, 0.3642818, -0.11331124) * go_2(1.0, 0.0);
  result += mat4(-0.025740806, 0.14551482, -0.037410017, -0.17477523, -0.11853099, -0.060820814, -0.102599286, -0.13267937, -0.103053465, -0.014044828, -0.01888072, -0.06499249, 0.22311528, -0.051850274, -0.034120858, 0.044562567) * go_2(1.0, 1.0);
  result += mat4(-0.21360217, 0.10093803, -0.0016407765, -0.1473997, 0.26524043, 0.02112132, 0.23173104, -0.013157391, 0.05945182, 0.044635538, 0.06031638, -0.21435826, -0.10147484, 0.069090195, 0.09641844, -0.09581093) * go_3(-1.0, -1.0);
  result += mat4(-0.08576515, -0.122861005, 0.049567085, -0.085854456, 0.23809357, -0.024966082, -0.10294079, 0.046241313, 0.008621132, -0.08323767, 0.20277941, 0.163423, -0.07386535, -0.088738985, 0.05274358, -0.025479877) * go_3(-1.0, 0.0);
  result += mat4(-0.041135542, -0.008365642, 0.17088248, 0.04025207, 0.13809255, -0.056895368, -0.01582834, 0.07361908, -0.00068995473, -0.09300962, 0.19117641, 0.24832036, -0.06572358, -0.026025, -0.019093119, -0.049720034) * go_3(-1.0, 1.0);
  result += mat4(0.024900286, 0.11525501, 0.025882801, 0.037742402, 0.36976853, 0.052211333, -0.15143296, 0.1802276, -0.059080046, 0.017990451, 0.026395092, -0.12689115, -0.07705386, 0.1232379, 0.13273561, -0.12521964) * go_3(0.0, -1.0);
  result += mat4(-0.19788785, 0.044887315, 0.07663442, 0.16688696, -0.2842248, -0.15684547, 0.028387763, 0.0063470444, -0.012245601, -0.038382255, -0.8187406, -0.25245667, 0.23014604, 0.22746666, 0.1594356, 0.16469443) * go_3(0.0, 0.0);
  result += mat4(-0.12663333, 0.014730006, 0.03765697, 0.15704912, -0.106595434, -0.05317512, -0.081759915, -0.08797109, 0.064620756, -0.06341419, 0.16493447, 0.23102313, 0.068325415, -0.088058695, 0.16885915, 0.036382258) * go_3(0.0, 1.0);
  result += mat4(0.035389822, -0.11811836, -0.035656307, -0.0680554, 0.1338908, 0.065852076, 0.023307983, 0.0675308, 0.09690683, 0.18170924, 0.09862692, -0.20964378, -0.08601271, -0.20016764, -0.01879598, -0.14629345) * go_3(1.0, -1.0);
  result += mat4(-0.27183273, 0.013525998, -0.14995874, -0.23938845, -0.26218823, -0.0009874097, -0.13385512, -0.10664239, -0.048931994, 0.039898522, 0.047444753, 0.10934722, 0.10969629, 0.123539805, 0.11692802, 0.14172275) * go_3(1.0, 0.0);
  result += mat4(-0.1656506, 0.019683002, 0.0221048, 0.12596753, 0.20420644, -0.07930122, 0.04653823, 0.11492255, -0.0050175437, -0.03271697, 0.013389486, 0.034583613, -0.2196601, -0.1615663, -0.013763388, -0.056037936) * go_3(1.0, 1.0);
  result += vec4(-0.022956269, 0.029688787, -0.070148066, -0.07163476);
  gl_FragColor = result;
}
