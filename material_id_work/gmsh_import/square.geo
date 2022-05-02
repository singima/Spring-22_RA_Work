// Gmsh project created on Mon Mar  7 15:40:42 2022
SetFactory("OpenCASCADE");

Point(1) = {-1, -1, -0, .1};
Point(2) = {1, -1, -0, .1};
Point(3) = {1, 1, -0, .1};
Point(4) = {-1, 1, -0, .1};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
//+
Curve Loop(5) = {3, 4, 1, 2};
//+
Plane Surface(5) = {5};
