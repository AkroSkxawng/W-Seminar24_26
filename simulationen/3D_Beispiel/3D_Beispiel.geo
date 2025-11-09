SetFactory("OpenCASCADE");
Mesh.SaveAll=1;
lc = 0.25;

Point(1)={0,0,0, lc};
Point(2)={0,2,0, lc};
Point(3)={5,2,0, lc};
Point(4)={5,0,0, lc};
Line(1)={1,2};
Line(2)={2,3};
Line(3)={3,4};
Line(4)={4,1};
Curve Loop(1)={1,2,3,4};
Plane Surface(10)={1};

Extrude{0,0,2}{Surface{10};};

Mesh 3;
Mesh.MshFileVersion = 2.2;
Save "dryMesh.msh";