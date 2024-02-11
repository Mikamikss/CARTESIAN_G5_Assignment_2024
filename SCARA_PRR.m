disp('SCARA_PRR')

syms a1 a2 a3 a4 d1

%% Link lengths
a1 = 8;
a2 = 5;
a3 = 5;
a4 = 5;
d1 = 6;

%% D-H parametrics : theta, d, r, alpha, offset
% if prismatic joint: theta = theta, d = 0, offset = 1, after offset put the value
% of d
% if revolute joint: theta = 0, offset = 0, after offset put the value of theta

H0_1 = Link([0,0,0,0,1,a1]);
H0_1.qlim = [0 d1];

H1_2 = Link([0,0,a2,0,0,0]);
H1_2.qlim = pi/180*[-90 90];

H2_3 = Link([0,0,a3,0,0,0]);
H2_3.qlim = pi/180*[-90 90];

H3_4 = Link([0,0,a4,0,0,0]);
H3_4.qlim = pi/180*[-90 90];

%% Build the Mechanical Manipulator
SCARA = SerialLink([H0_1 H1_2 H2_3 H3_4], 'name', 'SCARA');
SCARA.plot([0 0 0 0], 'workspace', [-10 15 -15 10 -5 20])
SCARA.teach