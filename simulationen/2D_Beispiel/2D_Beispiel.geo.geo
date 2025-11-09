SetFactory("OpenCASCADE");
Mesh.SaveAll=1;
    
    //--------------------------------------------------
    // Parameters (all in mm here; Elmer will treat SI later)
    //--------------------------------------------------
arm_w   = 2.0;   // width of arms
arm_l   = 4.0;   // half-length from center to contact edge
pad_l   = 1.0;   // pad length
pad_w   = 2.0;   // pad width (match arm width for clean contact)

// Mesh control
lc_coarse = 0.5;
lc_fine   = 0.097;

//--------------------------------------------------
// Main cross geometry
//--------------------------------------------------
Rectangle(1) = {-arm_l, -arm_w/2, 0, 2*arm_l, arm_w};   // horizontal bar
Rectangle(2) = {-arm_w/2, -arm_l, 0, arm_w, 2*arm_l};   // vertical bar
BooleanUnion{ Surface{1}; Delete; }{ Surface{2}; Delete; }

//--------------------------------------------------
// Contact pads as rectangles (stick out each arm)
//--------------------------------------------------
Rectangle(10) = {-(arm_l+pad_l), -pad_w/2, 0, pad_l, pad_w};    // left
Rectangle(11) = { arm_l,         -pad_w/2, 0, pad_l, pad_w};    // right
Rectangle(12) = {-pad_w/2, -(arm_l+pad_l), 0, pad_w, pad_l};    // bottom
Rectangle(13) = {-pad_w/2,  arm_l,         0, pad_w, pad_l};    // top

//--------------------------------------------------
// Collect surfaces into Physical groups
//--------------------------------------------------
Physical Surface("HallPlate")      = {1};     // the cross
Physical Surface("Contact_Left")   = {10};    // left pad
Physical Surface("Contact_Right")  = {11};    // right pad
Physical Surface("Contact_Bottom") = {12};    // bottom pad
Physical Surface("Contact_Top")    = {13};    // top pad

// Collect all surfaces you want to merge
allSurfaces[] = {1,10,11,12,13};  // replace with your surface IDs if different

// Perform BooleanFragments to merge and create conforming mesh
fr[] = BooleanFragments{ Surface{allSurfaces[]}; Delete; }{};


    //--------------------------------------------------
    // Mesh refinement near corners and contacts
    //--------------------------------------------------

// Global limits
Mesh.CharacteristicLengthMax = lc_coarse;
Mesh.CharacteristicLengthMin = lc_fine;

// Field[1]: distance refinement near corners
Field[1] = Distance;
Field[1].EdgesList = {1:18}; // grab all cross edges after union (adjust IDs!)
Field[2] = Threshold;
Field[2].InField = 1;
Field[2].SizeMin = lc_fine;    // finest mesh at contacts/corners
Field[2].SizeMax = lc_coarse;  // coarse away from features
Field[2].DistMin = 0.2;        // within 0.2 mm → lc_fine
Field[2].DistMax = 1.0;        // after 1 mm → lc_coarse
Background Field = 2;

// Mesh quality tweaks (like COMSOL settings)
Mesh.Algorithm = 6;                // Frontal-Delaunay
Mesh.CharacteristicLengthFromCurvature = 1;
Mesh.CharacteristicLengthFromPoints = 1;
Mesh.CharacteristicLengthFromEdges = 1;
Mesh.MeshSizeExtendFromBoundary = 1;
Mesh.MeshSizeFromPoints = 1;
Mesh.MeshSizeFromCurvature = 1;
esh.RecombineAll = 0; // stick to triangles
Mesh.Smoothing = 10;   // smooth final mesh

    // Use transfinite meshing on contact lines if you want uniform segments
    // Transfinite Line{1,3,5,7} = 10 Using Progression 1;  // optional

Mesh 2;
Mesh.MshFileVersion = 2.2;
Save "2dSample.msh";