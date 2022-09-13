psWidth = 104.8;
psDepth = 63.5;
psHeight = 218.6;
psWall = 3.05;
psBottomHoleHeight = 5.1;

powerSupply();

module powerSupply()
{
	color([ 0.75, 0.75, 0.75 ])
	{
		union()
		{
			difference()
			{
				cube([ psWidth, psDepth, psHeight ]); // main pad
				translate([ psWall, 0, 0 ])           // bottom hole
				{
					cube([ psWidth - psWall * 2, psDepth - psWall, psBottomHoleHeight ]);
				}
				sideScrews();
				fanHole();
				fanScrews();
			}
			outputSocket();
			inputSocket();
		}
	}
}

psSideHoleRadius = 1.5;
psSideHoleBottomHeight = 33;
psSideHoleTopHeight = psHeight - 32.8;
psSideHoleFrontDepth = 13;
psSideHoleBackDepth = psDepth - 12.5;
module sideScrews()
{

	union()
	{
		translate([ psWidth / 2, psSideHoleFrontDepth, psSideHoleBottomHeight ])
		rotate([ 90, 0, 90 ])
		cylinder(r = psSideHoleRadius, h = psWidth, center = true);

		translate([ psWidth / 2, psSideHoleBackDepth, psSideHoleBottomHeight ])
		rotate([ 90, 0, 90 ])
		cylinder(r = psSideHoleRadius, h = psWidth, center = true);

		translate([ psWidth / 2, psSideHoleFrontDepth, psSideHoleTopHeight ])
		rotate([ 90, 0, 90 ])
		cylinder(r = psSideHoleRadius, h = psWidth, center = true);

		translate([ psWidth / 2, psSideHoleBackDepth, psSideHoleTopHeight ])
		rotate([ 90, 0, 90 ])
		cylinder(r = psSideHoleRadius, h = psWidth, center = true);
	}
}

psOutputHeight = 22.5;
module outputSocket()
{
	translate([ 23.5, 33.5, -psOutputHeight + psBottomHoleHeight ]) // output socket
	cube([ 68, 21, psOutputHeight ]);
}

psTopHoleHeight = 10;
psFanRadius = 56.7 / 2;
module fanHole()
{
	translate([ psWidth - psFanRadius - 7.5, psDepth / 2, psHeight - psTopHoleHeight ])
	cylinder(r = psFanRadius, h = psTopHoleHeight);
}

module inputSocket()
{
	translate([ psWall, 40, psHeight ])
	cube([ 34.8, 15, 11 ]);
}

module fanScrews()
{
	union()
	{
		translate([ 45, 56.5, psHeight - psTopHoleHeight ])
		cylinder(r = 5 / 2, h = psTopHoleHeight);

		translate([ 20, 6, psHeight - psTopHoleHeight ])
		cylinder(r = 1, h = psTopHoleHeight);
	}
}
