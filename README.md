Below are the 3 manipulators DH parametric table, with their kinematic diagrams

1. Spherical Manipulator-Modern Variant
 ![IMG20240212073607_00](https://github.com/Mikamikss/CARTESIAN_G5_Assignment_2024/assets/157662884/f79a0c68-1f30-4c20-9c77-4388e96e1900)

disp('Spherical')

syms a1 a2 a3 d3

%% Link lengths
a1 = 5;
a2 = 6;
a3 = 3;
d3 = 5;

%% D-H parametrics : theta, d, r, alpha, offset
% if prismatic joint: theta = theta, d = 0, offset = 1, after offset put the value
% of d
% if revolute joint: theta = 0, offset = 0, after offset put the value of theta

H0_1 = Link([0,a1,0,pi/2,0,0]);
H0_1.qlim = pi/180*[-90 90];

H1_2 = Link([0,0,a2,pi/2,0,pi/2]);
H1_2.qlim = pi/180*[-90 90];

H2_3 = Link([0,0,0,0,1,a3]);
H2_3.qlim = [0 d3];

%% Build the Mechanical Manipulator
Spherical = SerialLink([H0_1 H1_2 H2_3], 'name', 'Spherical');
Spherical.plot([0 0 0], 'workspace', [-10 15 -10 10 -5 20])
Spherical.teach


2. SCARA - PRR MANIPULATOR
![SCARA](https://github.com/Mikamikss/CARTESIAN_G5_Assignment_2024/assets/158114394/a652c409-ff7e-48a6-8ab8-b1eee40365d6)

disp('SCARA_PRR')

syms a1 a2 a3 a4 d1

%% Link lengths a1 = 8; a2 = 5; a3 = 5; a4 = 5; d1 = 6;

%% D-H parametrics : theta, d, r, alpha, offset % if prismatic joint: theta = theta, d = 0, offset = 1, after offset put the value % of d % if revolute joint: theta = 0, offset = 0, after offset put the value of theta

H0_1 = Link([0,0,0,0,1,a1]); H0_1.qlim = [0 d1];

H1_2 = Link([0,0,a2,0,0,0]); H1_2.qlim = pi/180*[-90 90];

H2_3 = Link([0,0,a3,0,0,0]); H2_3.qlim = pi/180*[-90 90];

H3_4 = Link([0,0,a4,0,0,0]); H3_4.qlim = pi/180*[-90 90];

%% Build the Mechanical Manipulator SCARA = SerialLink([H0_1 H1_2 H2_3 H3_4], 'name', 'SCARA'); SCARA.plot([0 0 0 0], 'workspace', [-10 15 -15 10 -5 20]) SCARA.teach


3. Cartesian Manipulator On Ceiling
   ![IMG20240212080231](https://github.com/CKeeeent/CARTESIAN_G5_Assignment_2024/assets/159670239/649695c9-b0df-45f1-80cd-c707b4ef90d6)

disp('Cartesian')

syms a1 a2 a3 a4 d1 d2 d3

%% Link lengths
a1 = 8;
a2 = 8;
a3 = 8;
a4 = 8;
d1 = 6;
d2 = 6;
d3 = 6;

%% D-H parametrics : theta, d, r, alpha, offset
% if prismatic joint: theta = theta, d = 0, offset = 1, after offset put the value
% of d
% if revolute joint: theta = 0, offset = 0, after offset put the value of theta

H0_1 = Link([0,0,0,pi/2,1,-a1]);
H0_1.qlim = [0 30];

H1_2 = Link([pi/2,0,0,pi/2,1,a2]);
H1_2.qlim = [0 d1];

H2_3 = Link([3*pi/2,0,0,pi/2,1,a3]);
H2_3.qlim = [0 d2];

H3_4 = Link([0,0,0,0,1,a4]);
H3_4.qlim = [0 d3];

%% Build the Mechanical Manipulator
Cartesian = SerialLink([H0_1 H1_2 H2_3 H3_4], 'name', 'Cartesian');
Cartesian.plot([0 0 0 0], 'workspace', [-30 35 -35 20 -30 20])
Cartesian.teach
