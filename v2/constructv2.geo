SetFactory("OpenCASCADE");
Mesh.SaveAll=1;
lc = 0.0105; //2.5e-2
radius=0.508;
height=0.00279;
activeRadius=0.41/2; //0.438/2?
equalSideLength=2*activeRadius*Sin(Pi/8);
padSpacing=((activeRadius-0.01)*Sqrt(2))/2; //padSpacing=0.1925?
biasingThickness=0.0005;
biasingSideLength=0.015;
readOutThickness=biasingThickness;
readOutSideLength=0.007;

//Volume Grabs
tempVolumeStore1=newreg;
tempVolumeStore2=newreg;
tempVolumeStore3=newreg;
tempVolumeStore4=newreg;
tempVolumeStore5=newreg;
tempVolumeStore6=newreg;
tempVolumeStore7=newreg;
tempVolumeStore8=newreg;
tempVolumeStore8=newreg;
tempVolumeStore9=newreg;


//Wafer:

	//points
	Point(101)={0,radius/2,0,lc};
	Point(102)={0, -radius/2,0,lc};

	//centers
	Point(100)={0, 0,0,lc};

	//arcs
	Circle(101)={101,100,102};
	Circle(102)={102,100,101};

	//circle1
	Curve Loop(100)={101,102};
	Plane Surface(100)={100};

	//volume
	wafer[]=Extrude {0,0,height} {Surface{100};} Using Volume{tempVolumeStore1};
	
	//boundaries and bodies
	Physical Surface(0)={103};
	Physical Surface(1)={100,101,102};
	Physical Volume("Wafer",100)={tempVolumeStore1};

//Contacts:

	//pointsOfBase 
	Point(211)={equalSideLength/2,activeRadius,height,lc};
	Point(212)={-equalSideLength/2,activeRadius,height,lc};
	Point(213)={equalSideLength/2,-activeRadius,height,lc};
	Point(214)={-equalSideLength/2,-activeRadius,height,lc};
	Point(215)={activeRadius,equalSideLength/2,height,lc};
	Point(216)={activeRadius,-equalSideLength/2,height,lc};
	Point(217)={-activeRadius,equalSideLength/2,height,lc};
	Point(218)={-activeRadius,-equalSideLength/2,height,lc};


	//linesOfBase
	Line(211)={215,211};
	Line(212)={212,211};
	Line(213)={213,214};
	Line(214)={214,218};
	Line(215)={215,216};
	Line(216)={216,213};
	Line(217)={217,212};
	Line(218)={218,217};

	//pointsOfContacts 
	Point(221)={padSpacing,padSpacing,height,lc};
	Point(222)={padSpacing,-padSpacing,height,lc};
	Point(223)={-padSpacing,-padSpacing,height,lc};
	Point(224)={-padSpacing,padSpacing,height,lc};
	Point(225)={padSpacing,0,height,lc};
	Point(226)={-padSpacing,0,height,lc};
	Point(227)={0,padSpacing,height,lc};
	Point(228)={0,-padSpacing,height,lc};

	//biasing
		//biasing1
		Point(231)={padSpacing+biasingSideLength/2,0+biasingSideLength/2,height,lc};
		Point(232)={padSpacing+biasingSideLength/2,0-biasingSideLength/2,height,lc};
		Point(233)={padSpacing-biasingSideLength/2,0-biasingSideLength/2,height,lc};
		Point(234)={padSpacing-biasingSideLength/2,0+biasingSideLength/2,height,lc};
		Line(231)={231,232};
		Line(232)={232,233};
		Line(233)={233,234};
		Line(234)={234,231};
		Curve Loop(230)={231,232,233,234};
		Plane Surface(230)={230};
		bias1[]=Extrude {0,0,biasingThickness} {Surface{230};} Using Volume{tempVolumeStore2};

		//biasing2
		Point(251)={-padSpacing+biasingSideLength/2,-0+biasingSideLength/2,height,lc};
		Point(252)={-padSpacing+biasingSideLength/2,-0-biasingSideLength/2,height,lc};
		Point(253)={-padSpacing-biasingSideLength/2,-0-biasingSideLength/2,height,lc};
		Point(254)={-padSpacing-biasingSideLength/2,-0+biasingSideLength/2,height,lc};
		Line(251)={251,252};
		Line(252)={252,253};
		Line(253)={253,254};
		Line(254)={254,251};
		Curve Loop(250)={251,252,253,254};
		Plane Surface(250)={250};
		bias2[]=Extrude {0,0,biasingThickness} {Surface{250};} Using Volume{tempVolumeStore3};

		//biasing3
		Point(271)={-0+biasingSideLength/2,-padSpacing+biasingSideLength/2,height,lc};
		Point(272)={-0+biasingSideLength/2,-padSpacing-biasingSideLength/2,height,lc};
		Point(273)={-0-biasingSideLength/2,-padSpacing-biasingSideLength/2,height,lc};
		Point(274)={-0-biasingSideLength/2,-padSpacing+biasingSideLength/2,height,lc};
		Line(271)={271,272};
		Line(272)={272,273};
		Line(273)={273,274};
		Line(274)={274,271};
		Curve Loop(270)={271,272,273,274};
		Plane Surface(270)={270};
		bias3[]=Extrude {0,0,biasingThickness} {Surface{270};} Using Volume{tempVolumeStore4};

		//biasing4
		Point(291)={-0+biasingSideLength/2,padSpacing+biasingSideLength/2,height,lc};
		Point(292)={-0+biasingSideLength/2,padSpacing-biasingSideLength/2,height,lc};
		Point(293)={-0-biasingSideLength/2,padSpacing-biasingSideLength/2,height,lc};
		Point(294)={-0-biasingSideLength/2,padSpacing+biasingSideLength/2,height,lc};
		Line(291)={291,292};
		Line(292)={292,293};
		Line(293)={293,294};
		Line(294)={294,291};
		Curve Loop(290)={291,292,293,294};
		Plane Surface(290)={290};
		bias5[]=Extrude {0,0,biasingThickness} {Surface{290};} Using Volume{tempVolumeStore5};

	//readOut
		//readOut1
		Point(331)={padSpacing+readOutSideLength/2,padSpacing+readOutSideLength/2,height,lc};
		Point(332)={padSpacing+readOutSideLength/2,padSpacing-readOutSideLength/2,height,lc};
		Point(333)={padSpacing-readOutSideLength/2,padSpacing-readOutSideLength/2,height,lc};
		Point(334)={padSpacing-readOutSideLength/2,padSpacing+readOutSideLength/2,height,lc};
		Line(331)={331,332};
		Line(332)={332,333};
		Line(333)={333,334};
		Line(334)={334,331};
		Curve Loop(330)={331,332,333,334};
		Plane Surface(330)={330};
		bias6[]=Extrude {0,0,biasingThickness} {Surface{330};} Using Volume{tempVolumeStore6};

		//readOut2
		Point(351)={padSpacing+readOutSideLength/2,-padSpacing+readOutSideLength/2,height,lc};
		Point(352)={padSpacing+readOutSideLength/2,-padSpacing-readOutSideLength/2,height,lc};
		Point(353)={padSpacing-readOutSideLength/2,-padSpacing-readOutSideLength/2,height,lc};
		Point(354)={padSpacing-readOutSideLength/2,-padSpacing+readOutSideLength/2,height,lc};
		Line(351)={351,352};
		Line(352)={352,353};
		Line(353)={353,354};
		Line(354)={354,351};
		Curve Loop(350)={351,352,353,354};
		Plane Surface(350)={350};
		bias7[]=Extrude {0,0,biasingThickness} {Surface{350};} Using Volume{tempVolumeStore7};

		//readOut3
		Point(371)={-padSpacing+readOutSideLength/2,padSpacing+readOutSideLength/2,height,lc};
		Point(372)={-padSpacing-readOutSideLength/2,padSpacing+readOutSideLength/2,height,lc};
		Point(373)={-padSpacing-readOutSideLength/2,padSpacing-readOutSideLength/2,height,lc};
		Point(374)={-padSpacing+readOutSideLength/2,padSpacing-readOutSideLength/2,height,lc};
		Line(371)={371,372};
		Line(372)={372,373};
		Line(373)={373,374};
		Line(374)={374,371};
		Curve Loop(370)={371,372,373,374};
		Plane Surface(370)={370};
		bias8[]=Extrude {0,0,biasingThickness} {Surface{370};} Using Volume{tempVolumeStore8};

		//readOut4
		Point(391)={-padSpacing+readOutSideLength/2,-padSpacing+readOutSideLength/2,height,lc};
		Point(392)={-padSpacing-readOutSideLength/2,-padSpacing+readOutSideLength/2,height,lc};
		Point(393)={-padSpacing-readOutSideLength/2,-padSpacing-readOutSideLength/2,height,lc};
		Point(394)={-padSpacing+readOutSideLength/2,-padSpacing-readOutSideLength/2,height,lc};
		Line(391)={391,392};
		Line(392)={392,393};
		Line(393)={393,394};
		Line(394)={394,391};
		Curve Loop(390)={391,392,393,394};
		Plane Surface(390)={390};
		bias9[]=Extrude {0,0,biasingThickness} {Surface{390};} Using Volume{tempVolumeStore9};


	//boundaries and bodies
		//bias
		Physical Surface(230)={230};
		Physical Surface(231)={231,232,233,234,235};
		Physical Volume("bias1",230)={tempVolumeStore2};

		Physical Surface(250)={250};
		Physical Surface(251)={251,252,253,254,255};
		Physical Volume("bias2",250)={tempVolumeStore3};

		Physical Surface(270)={270};
		Physical Surface(271)={271,272,273,274,275};
		Physical Volume("bias3",270)={tempVolumeStore4};

		Physical Surface(290)={290};
		Physical Surface(291)={291,292,293,294,295};
		Physical Volume("bias4",290)={tempVolumeStore5};

		//readOut
		Physical Surface(330)={330};
		Physical Surface(331)={331,332,333,334,335};
		Physical Volume("readOut1",330)={tempVolumeStore6};

		Physical Surface(350)={350};
		Physical Surface(351)={351,352,353,354,355};
		Physical Volume("readOut2",350)={tempVolumeStore7};

		Physical Surface(370)={370};
		Physical Surface(371)={371,372,373,374,375};
		Physical Volume("readOut3",370)={tempVolumeStore8};

		Physical Surface(390)={390};
		Physical Surface(391)={391,392,393,394,395};
		Physical Volume("readOut4",390)={tempVolumeStore9};

CompoundSurface(400)={wafer[0], 230, 250, 270, 290, 330, 350, 370, 390};
Surface Loop(1) = {100, 400 , wafer[1], wafer[2]};
Volume(tempVolumeStore1) = {1};


Compound Volume(1)={tempVolumeStore1, tempVolumeStore2, tempVolumeStore3, tempVolumeStore4, tempVolumeStore5, tempVolumeStore6, tempVolumeStore7, tempVolumeStore8, tempVolumeStore9};

Mesh 3;
Mesh.MshFileVersion = 2.2;
Save "constructv2.msh";

