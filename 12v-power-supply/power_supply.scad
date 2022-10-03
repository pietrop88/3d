powerSupplySize = [ 104.8, 63.5, 218.6 ];
powerSupplyBottomHoleDepth = 5.1;
powerSupplyWall = 3.05;

module powerSupply()
{
	color([ 0.75, 0.75, 0.75 ])
	{
		union()
		{
			difference()
			{
				cube(powerSupplySize);               // main pad
				translate([ powerSupplyWall, 0, 0 ]) // bottom hole
				{
					cube([
						powerSupplySize.x - powerSupplyWall * 2, powerSupplySize.y - powerSupplyWall,
						powerSupplyBottomHoleDepth
					]);
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

module sideScrews()
{
	psSideHoleRadius = 1.5;
	psSideHoleBottomHeight = 33;
	psSideHoleTopHeight = powerSupplySize.z - 32.8;
	psSideHoleFrontDepth = 13;
	psSideHoleBackDepth = powerSupplySize.y - 12.5;
	union()
	{
		translate([ powerSupplySize.x / 2, psSideHoleFrontDepth, psSideHoleBottomHeight ])
		rotate([ 90, 0, 90 ])
		cylinder(r = psSideHoleRadius, h = powerSupplySize.x, center = true);

		translate([ powerSupplySize.x / 2, psSideHoleBackDepth, psSideHoleBottomHeight ])
		rotate([ 90, 0, 90 ])
		cylinder(r = psSideHoleRadius, h = powerSupplySize.x, center = true);

		translate([ powerSupplySize.x / 2, psSideHoleFrontDepth, psSideHoleTopHeight ])
		rotate([ 90, 0, 90 ])
		cylinder(r = psSideHoleRadius, h = powerSupplySize.x, center = true);

		translate([ powerSupplySize.x / 2, psSideHoleBackDepth, psSideHoleTopHeight ])
		rotate([ 90, 0, 90 ])
		cylinder(r = psSideHoleRadius, h = powerSupplySize.x, center = true);
	}
}

module outputSocket()
{
	psOutputHeight = 22.5;
	translate([ 23.5, 33.5, -psOutputHeight + powerSupplyBottomHoleDepth ]) // output socket
	cube([ 68, 21, psOutputHeight ]);
}

psTopHoleHeight = 10;
module fanHole()
{
	psFanRadius = 56.7 / 2;
	translate([ powerSupplySize.x - psFanRadius - 7.5, powerSupplySize.y / 2, powerSupplySize.z - psTopHoleHeight ])
	cylinder(r = psFanRadius, h = psTopHoleHeight);
}

module inputSocket()
{
	translate([ powerSupplyWall, 40, powerSupplySize.z ])
	cube([ 34.8, 15, 11 ]);
}

module fanScrews()
{
	union()
	{
		translate([ 45, 56.5, powerSupplySize.z - psTopHoleHeight ])
		cylinder(r = 5 / 2, h = psTopHoleHeight);

		translate([ 20, 6, powerSupplySize.z - psTopHoleHeight ])
		cylinder(r = 1, h = psTopHoleHeight);
	}
}
