// Gmsh project created on Sat Jan  1 15:40:31 2022
SetFactory("OpenCASCADE");

//----------------------------------------------------------------
// IMPORTANT LENGTHS
G = 20;	// Gauge Length
W = 4;		// Width
T = 0.5;	// Thickness
R = 2.5;	// Radius of fillet
L = 45;	// Overall Length
A = 22.5;	// Length of reduced parallel section (minimum)
B = 7.5;	// Length of grip section
C = 5;		// Width of grip section
Meshsize = 1.0;// Change this for the meshsize of the lines

//----------------------------------------------------------------
// IMPORTANT POINTS

// Origin & centerpoints (Center of bone)
Point(1) = {0      , 0, 0, Meshsize};
Point(2) = {-.5 * W, 0, 0, Meshsize};	
Point(3) = { .5 * W, 0, 0, Meshsize}; 

// Gauge length points
Point(4) = {-.5 * W,  .5 * G, 0, Meshsize};
Point(5) = { .5 * W,  .5 * G, 0, Meshsize};
Point(6) = {-.5 * W, -.5 * G, 0, Meshsize};
Point(7) = { .5 * W, -.5 * G, 0, Meshsize};

// Reduced parallel section points
Point(8) =  {-.5 * W,  .5 * A, 0, Meshsize};
Point(9) =  { .5 * W,  .5 * A, 0, Meshsize};
Point(10) = {-.5 * W, -.5 * A, 0, Meshsize};
Point(11) = { .5 * W, -.5 * A, 0, Meshsize};

// Top grip section points
Point(12) = {-.5 * C, .5 * L - B, 0, Meshsize};
Point(13) = {-.5 * C,     .5 * L, 0, Meshsize};
Point(14) = { .5 * C,     .5 * L, 0, Meshsize};
Point(15) = { .5 * C, .5 * L - B, 0, Meshsize};

// Simple dogbone points (removing curvature)
Point(112) = {-.5 * W,  .5 * L - B, 0, Meshsize};
Point(115) = { .5 * W,  .5 * L - B, 0, Meshsize};
Point(116) = {-.5 * W, -.5 * L + B, 0, Meshsize};
Point(119) = { .5 * W, -.5 * L + B, 0, Meshsize};

// Bottom grip section points
Point(16) = {-.5 * C, -.5 * L + B, 0, Meshsize};
Point(17) = {-.5 * C,     -.5 * L, 0, Meshsize};
Point(18) = { .5 * C,     -.5 * L, 0, Meshsize};
Point(19) = { .5 * C, -.5 * L + B, 0, Meshsize};

//----------------------------------------------------------------
// IMPORTANT LINES

// These are the lines for the outer domain, not much to say
Line(1) = {3, 1};
Line(2) = {1, 2};
Line(3) = {2, 4};
Line(4) = {4, 8};
Line(5) = {3, 5};
Line(6) = {5, 9};
Line(7) = {2, 6};
Line(8) = {6, 10};
Line(9) = {3, 7};
Line(10) = {7, 11};
Line(11) = {12, 13};
Line(12) = {13, 14};
Line(13) = {14, 15};
Line(14) = {16, 17};
Line(15) = {17, 18};
Line(16) = {18, 19};
Line(17) = {8, 112};
Line(18) = {112, 12};
Line(19) = {9, 115};
Line(20) = {115, 15};
Line(21) = {10, 116};
Line(22) = {116, 16};
Line(23) = {11, 119};
Line(24) = {119, 19};

//----------------------------------------------------------------
// BOUNDARY IDs
Physical Curve("1") = {12};
Physical Curve("2") = {15};

//----------------------------------------------------------------
// PHYSICAL SURFACES	
Physical Surface(1) = {1, 2};

//----------------------------------------------------------------
// PLANE SURFACES

Curve Loop(1) = {11, 12, 13, -20, -19, -6, -5, 1, 2, 3, 4, 17, 18};
Plane Surface(1) = {1};

Curve Loop(2) = {7, 8, 21, 22, 14, 15, 16, -24, -23, -10, -9, 1, 2};
Plane Surface(2) = {2};

//----------------------------------------------------------------
// MESHING INFO
Mesh.Algorithm = 3;
Mesh.RecombineAll = 1;
Mesh.CharacteristicLengthFactor = .6;
Mesh.SubdivisionAlgorithm = 1;
Mesh.Smoothing = 20;
Show "*";
