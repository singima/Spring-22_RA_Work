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
Meshsize = 3.0;// Change this for the meshsize of the lines

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

//----------------------------------------------------------------
// CURVATURE POINTS AND ELLIPSES

// Top left Curve
Point(20) = {-.5 * C, .5 * L - B - R, 0, 1.0}; 
Point(21) = {-.5 * C,         .5 * A, 0, 1.0}; 
Ellipse(17) = {12, 21, 20, 8};

// Top right curve
Point(22) = {.5 * C, .5 * L - B - R, 0, 1.0};  
Point(23) = {.5 * C,         .5 * A, 0, 1.0};
Ellipse(18) = {15, 23, 22, 9};

// Bottom left curve
Point(24) = {-.5 * C, -.5 * L + B + R, 0, 1.0}; 
Point(25) = {-.5 * C,         -.5 * A, 0, 1.0}; 
Ellipse(19) = {16, 25, 24, 10};

// Bottom right curve
Point(26) = {.5 * C, -.5 * L + B + R, 0, 1.0}; 
Point(27) = {.5 * C,         -.5 * A, 0, 1.0};
Ellipse(20) = {19, 27, 26, 11};

//----------------------------------------------------------------
// BOUNDARY IDs
Physical Curve("1") = {12};
Physical Curve("2") = {15};

//----------------------------------------------------------------
// PLANE SURFACES

// Top half of the dogbone
Curve Loop(1) = {12, 13, 18, -6, -5, 1, 2, 3, 4, -17, 11};
Plane Surface(1) = {1};

// Bottom half of the dogbone
Curve Loop(2) = {8, -19, 14, 15, 16, 20, -10, -9, 1, 2, 7};
Plane Surface(2) = {2};

//----------------------------------------------------------------
// PHYSICAL SURFACES	
Physical Surface(1) = {1};
Physical Surface(2) = {2};

//----------------------------------------------------------------
// MESHING INFO
Mesh.Algorithm = 3;
Mesh.RecombineAll = 1;
Mesh.CharacteristicLengthFactor = .6;
Mesh.SubdivisionAlgorithm = 1;
Mesh.Smoothing = 20;
Show "*";
