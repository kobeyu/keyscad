/* [Key] */

R1_1x1 =     [1  ,1  ,1,0,0,0,1,0,18];
R2_1x1 =     [1  ,1  ,2,0,0,0,1,0,12];
R3_1x1 =     [1  ,1  ,3,0,0,0,1,0,8];
R3_1x1_loc =     [1  ,1  ,3,0,0,0,1,1,8];
R4_1x1 =     [1  ,1  ,4,0,0,0,0,0,10];
R4_1x1_inv = [1  ,1  ,4,0,1,0,0,0,10];
R1_1x1p5 =   [1.5,1  ,1,0,0,0,1,0,2];
R2_1x1p5 =   [1.5,1  ,2,0,0,0,1,0,2];
R3_1x1p5 =   [1.5,1  ,3,0,0,0,1,0,2];
R4_1x1p5 =   [1.5,1  ,4,0,0,0,0,0,2];
R2_2x1 =     [1  ,2  ,2,1,0,1,1,0,0];
R2_1p5x1 =   [1  ,1.5,2,0,0,1,1,0,2];
R3_1p5x1 =   [1  ,1.5,3,0,0,1,1,0,2];

R1_2x1 =     [1  ,2  ,1,1,0,1,1,0,4];
R5_1x1 =     [1  ,1  ,0,0,0,0,1,0,4];

Keys = [R3_1x1_loc];
//Keys = [R1_1x1,R2_1x1,R3_1x1,R4_1x1,R4_1x1_inv,R1_1x1p5,R2_1x1p5,R3_1x1p5,R4_1x1p5,R1_2x1,R2_1p5x1,R3_1p5x1,R5_1x1];
//Keys = [R1_2x1,R5_1x1];

function K_ergodox_qty(x) = x[8];
function key_locator(x) = x[7];

//length in units of key
function key_length(x) = x[0];
//height in units of key. should remain 1 for most uses
function key_height(x) = x[1];
//keycap type, [0:DCS Row 5, 1:DCS Row 1, 2:DCS Row 2, 3:DCS Row 3, 4:DCS Row 4, 5:DSA Row 3, 6:SA Row 1, 7:SA Row 2, 8:SA Row 3, 9:SA Row 4, 10:DCS Row 4 Spacebar, 11: g20 key (faked)]
function key_profile_index(x) = x[2];

// keytop thickness, aka how many millimeters between the inside and outside of the top surface of the key
keytop_thickness = 2.5;

// wall thickness, aka the thickness of the sides of the keycap. note this is the total thickness, aka 3 = 1.5mm walls
wall_thickness = 3;

/* [Brim] */
//enable brim for connector
has_brim = 0;
//brim radius. 11 ensconces normal keycap stem in normal keycap
brim_radius = 5;
//brim depth
brim_depth = .3;

/* [Stabilizers] */
//whether stabilizer connectors are enabled
function stabilizers(x) = x[3];
//stabilizer distance in mm
stabilizer_distance = 12;

/* [Dish] */
// invert dishing. mostly for spacebar
function inverted_dish(x) = x[4];

/* [Rotate Connectors] */
// rotate the connectors 90 degrees. for if the switch is also rotated (ergodox 2x1 keys)
function rotate_connectors(x) = x[5];
function key_internal_flat(x) = x[6];

/* [Stem] */
// cherry MX or Alps stem, or totally broken circular cherry stem [0..2]
stem_profile = 0;
// how inset the stem is from the bottom of the key. experimental. requires support
stem_inset = 0;
// stem offset in units NOT MM. for stepped caps lock
stem_offset = 0;

/* [Hidden] */
//change to round things better
$fn = 32;
//beginning to use unit instead of baked in 19.05
unit = 19.05;

//minkowski radius. radius of sphere used in minkowski sum for minkowski_key function. 1.75 default for faux G20
minkowski_radius = 1.75;

//profile specific stuff

/*
 Here we have, for lack of a better implementation, an array
 that defines the more intimate aspects of a key.
 order is thus:
 1. Bottom Key Width: width of the immediate bottom of the key
 2. Bottom Key Height: height of the immediate bottom of the key
 3. Top Key Width Difference: mm to subtract from bottom key width to create top key width
 4. Top Key Height Difference: mm to subtract from bottom key height to create top key height
 5. total Depth: how tall the total in the switch is before dishing
 6. Top Tilt: X rotation of the top. Top and dish obj are rotated
 7. Top Skew: Y skew of the top of the key relative to the bottom. DCS has some, DSA has none (its centered)
 8. Dish Type: type of dishing. check out dish function for the options
 9. Dish Depth: how many mm to cut into the key with
 10. Dish Radius: radius of dish obj, the Sphere or Cylinder that cuts into the keycap
*/

key_profiles = [

	//DCS Profile

	[ //DCS ROW 5
		18.16,  // Bottom Key Width
		18.16,  // Bottom Key Height
		6,   // Top Key Width Difference
		4,   // Top Key Height Difference
		11.5, // total Depth
		-6,  // Top Tilt
		1.75,// Top Skew

		//Dish Profile

		0,   // Dish Type
		1,   // Dish Depth
		0,   // Dish Skew X
		0    // DIsh Skew Y
	],
	[ //DCS ROW 1
		18.16,  // Bottom Key Width
		18.16,  // Bottom Key Height
		6,   // Top Key Width Difference
		4,   // Top Key Height Difference
		8.5, // total Depth
		-1,  // Top Tilt
		1.75,// Top Skew

		//Dish Profile

		0,   // Dish Type
		1,   // Dish Depth
		0,   // Dish Skew X
		0    // DIsh Skew Y
	],
	[ //DCS ROW 2
		18.16,  // Bottom Key Width
		18.16,  // Bottom Key Height
		6.2,   // Top Key Width Difference
		4,   // Top Key Height Difference
		7.5, // total Depth
		3,  // Top Tilt
		1.75,// Top Skew

		//Dish Profile

		0,   // Dish Type
		1,   // Dish Depth
		0,   // Dish Skew X
		0    // DIsh Skew Y
	],
	[ //DCS ROW 3
		18.16,  // Bottom Key Width
		18.16,  // Bottom Key Height
		6,   // Top Key Width Difference
		4,   // Top Key Height Difference
		6.2, // total Depth
		7,  // Top Tilt
		1.75,// Top Skew

		//Dish Profile

		0,   // Dish Type
		1,   // Dish Depth
		0,   // Dish Skew X
		0    // DIsh Skew Y
	],
	[ //DCS ROW 4
		18.16,  // Bottom Key Width
		18.16,  // Bottom Key Height
		6,   // Top Key Width Difference
		4,   // Top Key Height Difference
		6.2, // total Depth
		16,  // Top Tilt
		1.75,// Top Skew

		//Dish Profile

		0,   // Dish Type
		1,   // Dish Depth
		0,   // Dish Skew X
		0    // DIsh Skew Y
	],

	//DSA Profile

	[ //DSA ROW 3
	  18.4,  // Bottom Key Width
	  18.4,  // Bottom Key Height
	  5.7, // Top Key Width Difference
	  5.7, // Top Key Height Difference
	  7.4, // total Depth
	  0,   // Top Tilt
	  0,   // Top Skew

	  //Dish Profile

	  1,   // Dish Type
	  1.2, // Dish Depth
	  0,   // Dish Skew X
	  0    // DIsh Skew Y
	],

	//SA Proile

	[ //SA ROW 1
		18.4,  // Bottom Key Width
	  18.4,  // Bottom Key Height
	  5.7, // Top Key Width Difference
	  5.7, // Top Key Height Difference
	  13.73, // total Depth, fudged
	  -14,   // Top Tilt
	  0,   // Top Skew

	  //Dish Profile

	  1,   // Dish Type
	  1.2, // Dish Depth
	  0,   // Dish Skew X
	  0    // DIsh Skew Y
	],
	[ //SA ROW 2
		18.4,  // Bottom Key Width
	  18.4,  // Bottom Key Height
	  5.7, // Top Key Width Difference
	  5.7, // Top Key Height Difference
	  11.73, // total Depth
	  -7,   // Top Tilt
	  0,   // Top Skew

	  //Dish Profile

	  1,   // Dish Type
	  1.2, // Dish Depth
	  0,   // Dish Skew X
	  0    // DIsh Skew Y
	],
	[ //SA ROW 3
		18.4,  // Bottom Key Width
	  18.4,  // Bottom Key Height
	  5.7, // Top Key Width Difference
	  5.7, // Top Key Height Difference
	  11.73, // total Depth
	  0,   // Top Tilt
	  0,   // Top Skew

	  //Dish Profile

	  1,   // Dish Type
	  1.2, // Dish Depth
	  0,   // Dish Skew X
	  0    // DIsh Skew Y
	],
	[ //SA ROW 4
		18.4,  // Bottom Key Width
	  18.4,  // Bottom Key Height
	  5.7, // Top Key Width Difference
	  5.7, // Top Key Height Difference
	  11.73, // total Depth
	  7,   // Top Tilt
	  0,   // Top Skew

	  //Dish Profile

	  1,   // Dish Type
	  1.2, // Dish Depth
	  0,   // Dish Skew X
	  0    // DIsh Skew Y
	],
	[ //DCS ROW 4 SPACEBAR
		18.16,  // Bottom Key Width
		18.16,  // Bottom Key Height
		6,   // Top Key Width Difference
		4,   // Top Key Height Difference
		6.2, // total Depth
		16,  // Top Tilt
		1.75,// Top Skew

		//Dish Profile

		2,   // Dish Type
		1,   // Dish Depth
		0,   // Dish Skew X
		0    // DIsh Skew Y
	],
	[ //G20 AKA DCS Row 2 with no dish and shorter
		18.16,  // Bottom Key Width
		18.16,  // Bottom Key Height
		2,   // Top Key Width Difference
		2,   // Top Key Height Difference
		6, // total Depth
		2.5,  // Top Tilt
		0.75,// Top Skew

		//Dish Profile

		3,   // Dish Type
		0,   // Dish Depth
		0,   // Dish Skew X
		0    // DIsh Skew Y
	],
	[ //NONWORKING fake ISO enter
		18.16 * 1.5,  // Bottom Key Width
		18.16 * 2,  // Bottom Key Height
		4,   // Top Key Width Difference
		4,   // Top Key Height Difference
		7, // total Depth
		0,  // Top Tilt
		1.75,// Top Skew

		//Dish Profile

		0,   // Dish Type
		1,   // Dish Depth
		0,   // Dish Skew X
		0    // DIsh Skew Y
	],
];

// derived variables
//key profile selected
function key_profile(k) = key_profiles[key_profile_index(k)];

// names, so I don't go crazy
function bottom_key_width(k) = key_profile(k)[0];
function bottom_key_height(k) = key_profile(k)[1];
function width_difference(k) = key_profile(k)[2];
function height_difference(k) = key_profile(k)[3];
function total_depth(k) = key_profile(k)[4];
function top_tilt(k) = key_profile(k)[5] / key_height(k);
function top_skew(k) = key_profile(k)[6];
function dish_type(k) = key_profile(k)[7];
function dish_depth(k) = key_profile(k)[8];
function dish_skew_x(k) = key_profile(k)[9];
function dish_skew_y(k) = key_profile(k)[10];

// actual mm key width and height
function total_key_width(k) = bottom_key_width(k) + (unit * (key_length(k) - 1));
function total_key_height(k) = bottom_key_height(k) + (unit * (key_height(k) - 1));

// actual mm key width and height at the top
function top_total_key_width(k) = bottom_key_width(k) + (unit * (key_length(k) - 1)) - width_difference(k);
function top_total_key_height(k) = bottom_key_height(k) + (unit * (key_height(k) - 1)) - height_difference(k);

//centered
module roundedRect(size, radius) {
	x = size[0];
	y = size[1];
	z = size[2];

	translate([-x/2,-y/2,0])
	linear_extrude(height=z)
	hull() {
		translate([radius, radius, 0])
		circle(r=radius);

		translate([x - radius, radius, 0])
		circle(r=radius);

		translate([x - radius, y - radius, 0])
		circle(r=radius);

		translate([radius, y - radius, 0])
		circle(r=radius);
	}
}

// stem related stuff

module cherry_stem(k){
	// cross length
	cross_length = 4.7;
  //extra vertical cross length - the extra length of the up/down bar of the cross
  extra_vertical_cross_length = 1.1;
	//dimensions of connector
	// outer cross extra length in x
	extra_outer_cross_width = 2.10;
	// outer cross extra length in y
	extra_outer_cross_height = 0.8;
	// dimensions of cross
	// horizontal cross bar width
	horizontal_cross_width = 1.1;
	// vertical cross bar width
	vertical_cross_width = 1;
	// cross depth, stem height is 3.4mm
	cross_depth = 5;

    rotate([0,0,rotate_connectors(k) ? 90 : 0]){
    union(){
        difference(){
        
		union(){
            if (stem_profile != 2){
                translate([
                    -(cross_length+extra_outer_cross_width)/2,
                    -(cross_length+extra_outer_cross_height)/2,
                    stem_inset
                ])
    			cube([ // the base of the stem, the part the cruciform digs into
					cross_length+extra_outer_cross_width,
					cross_length+extra_outer_cross_height,
					50
    			]);
            } else {
                cylinder(
                    d = cross_length+extra_outer_cross_height,
                    h = 50
                );
            }
			if (has_brim == 1){ cylinder(r=brim_radius,h=brim_depth); }
		}
		//the cross part of the stem
		translate([0,0,(cross_depth)/2 + stem_inset]){
                cube([vertical_cross_width,cross_length+extra_vertical_cross_length,cross_depth], center=true );
                cube([cross_length,horizontal_cross_width,cross_depth], center=true );
            }
        }
        if(stem_inset > 0.3){
            supportheight = stem_inset - 0.3;
                            translate([
                        -(cross_length+extra_outer_cross_width+1)/2,
                        -(cross_length+extra_outer_cross_height+1)/2,
                        0
                    ])
            cube([
                cross_length+extra_outer_cross_width+1,
                cross_length+extra_outer_cross_height+1,
                supportheight
            ]);
        }
    }
}
}

module alps_stem(){
	cross_depth = 40;
	width = 4.45;
	height = 2.25;

	base_width = 12;
	base_height = 15;

	translate([0,0,cross_depth/2 + stem_inset]){
		cube([width,height,cross_depth], center = true);
	}
}

//whole connector, alps or cherry, trimmed to fit
module connector(k,has_brim){
	intersection(){
		//TODO can I really not do an array index here?
		translate([-unit * stem_offset, 0, 0])
		union(){
			if(stem_profile == 0 || stem_profile == 2) cherry_stem(k);
			if(stem_profile == 1) alps_stem();
		}
        shape(k,wall_thickness, keytop_thickness,key_internal_flat(k));
	}
}

//stabilizer connectors
module stabilizer_connectors(k,has_brim){
    if(key_height(k) > 1){
        translate([0,stabilizer_distance,0]) connector(k,has_brim);
        translate([0,-stabilizer_distance,0]) connector(k,has_brim);
    }else{
        translate([stabilizer_distance,0,0]) connector(k,has_brim);
        translate([-stabilizer_distance,0,0]) connector(k,has_brim);
    }
}



//shape related stuff

//general shape of key. used for inside and outside
module shape(k,thickness_difference, depth_difference, flatTop){
  if (inverted_dish(k) == 1){
		difference(){
			union(){
				shape_hull(k,thickness_difference, depth_difference, 1,flatTop);
                if(!flatTop){
                    dish(k,depth_difference);
                }

			}
			outside(k,thickness_difference);

		}
	} else{
		difference(){
			shape_hull(k,thickness_difference, depth_difference, 1,flatTop);
            if(!flatTop){
                dish(k,depth_difference);
            }
		}
	}
}

// conicalish clipping shape to trim things off the outside of the keycap
// literally just a key with height of 2 to make sure nothing goes awry with dishing etc
module outside(k,thickness_difference){
	difference(){
		cube([100000,100000,100000],center = true);
		shape_hull(k,thickness_difference, 0, 2,false);
	}
}



// super basic hull shape without dish
// modifier multiplies the height and top differences of the shape,
// which is only used for dishing to cut the dish off correctly
// height_difference used for keytop thickness
module shape_hull(k,thickness_difference, depth_difference, modifier,flatTop){
    union(){
	hull(){
		// bottom_key_width + (key_length -1) * unit is the correct length of the
		// key. only 1u of the key should be bottom_key_width long; all others
		// should be 1u
		roundedRect([total_key_width(k) - thickness_difference, total_key_height(k) - thickness_difference, .001],1.5);

		//height_difference outside of modifier because that doesnt make sense
        tilt = flatTop ? 0 : top_tilt(k);
		translate([0,top_skew(k),total_depth(k) * modifier - depth_difference])
		rotate([-tilt,0,0])
		roundedRect([total_key_width(k) - thickness_difference - width_difference(k) * modifier, total_key_height(k) - thickness_difference - height_difference(k) * modifier, .001],1.5);
	}
    }
}



//dish related stuff



//dish selector
module dish(k,depth_difference){
	if(dish_type(k) == 0){ // cylindrical dish
		cylindrical_dish(k,depth_difference);
	}
	else if (dish_type(k) == 1) { // spherical dish
		spherical_dish(k,depth_difference);
	}
	else if (dish_type(k) == 2){ // SIDEWAYS cylindrical dish - used for spacebar
		sideways_cylindrical_dish(k,depth_difference);
	}
      else if (dish_type(k) == 3){
  	// no dish
  }
}

module cylindrical_dish(k,depth_difference){
	/* we do some funky math here
	 * basically you want to have the dish "dig in" to the keycap x millimeters
	 * in order to do that you have to solve a small (2d) system of equations
	 * where the chord of the spherical cross section of the dish is
	 * the width of the keycap.
	 */
	// the distance you have to move the dish up so it digs in dish_depth millimeters
	chord_length = (pow(top_total_key_width(k), 2) - 4 * pow(dish_depth(k), 2)) / (8 * dish_depth(k));
	//the radius of the dish
	rad = (pow(top_total_key_width(k), 2) + 4 * pow(dish_depth(k), 2)) / (8 * dish_depth(k));

	if (inverted_dish(k) == 1){
		translate([dish_skew_x(k), top_skew(k) + dish_skew_y(k), total_depth(k) - depth_difference])
		rotate([90-top_tilt(k),0,0])
		translate([0,-chord_length,0])
		cylinder(h=100,r=rad, $fn=1024, center=true);
	}
	else{
		translate([dish_skew_x(k), top_skew(k) + dish_skew_y(k), total_depth(k) - depth_difference])
		rotate([90-top_tilt(k),0,0])
		translate([0,chord_length,0])
		cylinder(h=100,r=rad, $fn=1024, center=true);
	}

}

module spherical_dish(k,depth_difference){
	//same thing as the cylindrical dish here, but we need the corners to just touch - so we have to find the hypotenuse of the top
	chord = pow((pow(top_total_key_width(k),2) + pow(top_total_key_height(k), 2)),0.5); //getting diagonal of the top

	// the distance you have to move the dish up so it digs in dish_depth millimeters
	chord_length = (pow(chord, 2) - 4 * pow(dish_depth(k), 2)) / (8 * dish_depth(k));
	//the radius of the dish
	rad = (pow(chord, 2) + 4 * pow(dish_depth(k), 2)) / (8 * dish_depth(k));

	if (inverted_dish(k) == 1){
		translate([dish_skew_x(k), top_skew(k) + dish_skew_y(k), total_depth(k) - depth_difference])
		rotate([-top_tilt(k),0,0])
		translate([0,0,-chord_length])
		//NOTE: if your dish is long at all you might need to increase this number
		sphere(r=rad, $fn=512);
	}
	else{
		translate([dish_skew_x(k), top_skew(k) + dish_skew_y(k), total_depth(k) - depth_difference])
		rotate([-top_tilt(k),0,0])
		translate([0,0,chord_length])
		sphere(r=rad, $fn=256);
	}
}

module sideways_cylindrical_dish(k,depth_difference){
	chord_length = (pow(top_total_key_height(k), 2) - 4 * pow(dish_depth(k), 2)) / (8 * dish_depth(k));
	rad = (pow(top_total_key_height(k), 2) + 4 * pow(dish_depth(k), 2)) / (8 * dish_depth(k));

	if (inverted_dish(k) == 1){
		translate([dish_skew_x(k), top_skew(k) + dish_skew_y(k), total_depth(k) - depth_difference])
		rotate([90,top_tilt(k),90])
		translate([0,-chord_length,0])
		cylinder(h=total_key_width + 20,r=rad, $fn=1024, center=true); // +20 just cuz
	}
	else{
		translate([dish_skew_x(k), top_skew(k) + dish_skew_y(k), total_depth(k) - depth_difference])
		rotate([90,top_tilt(k),90])
		translate([0,chord_length,0])
		cylinder(h=total_key_width + 20,r=rad, $fn=1024, center=true);
	}
}

//actual full key with space carved out and keystem/stabilizer connectors
module key(k){
	union(){
		difference(){
			shape(k,0, 0,false);
			shape(k,wall_thickness, keytop_thickness,key_internal_flat(k));
		}
	}

	connector(k,has_brim);
    if(key_locator(k)==1){
        difference(){
        translate([0,-(total_key_height(k) - height_difference(k))/2 + 3.5,total_depth(k)-1.7])
        sphere(r=2);
        shape(k,0,0,false);
        }
    }


	if (stabilizers(k) == 1){
		stabilizer_connectors(k,has_brim);
	}
}

// ACTUAL OUTPUT
//difference(){
//	key();
	// preview cube, for seeing inside the keycap
    //translate([0,-50,0])
	//cube([100,100,100]);
//}

union(){
    for(i = [0:len(Keys)-1]){
        translate([i*30,0,0])
        key(Keys[i]);
    }
}

//minkowski_key();




// Experimental stuff


// key rounded with minkowski sum. still supports wall and keytop thickness.
// use in actual output section. takes a long time to render with dishes.
// required for keycap 11, G20 keycap.
module minkowski_key(){
	union(){
		difference(){
			minkowski(){
				shape(minkowski_radius*2, minkowski_radius);
				difference(){
					sphere(r=minkowski_radius, $fn=24);
					translate([0,0,-minkowski_radius])
						cube([2*minkowski_radius,2*minkowski_radius,2*minkowski_radius], center=true);
				}
			}
			shape(wall_thickness, keytop_thickness);
		}
	}

	connector(has_brim);

	if (stabilizers == 1){
		stabilizer_connectors(has_brim);
	}
}


// NOT 3D, NOT CENTERED
// corollary is roundedRect
module fakeISOEnter(thickness_difference){
    z = 0.001;
    radius = 2;
		/*TODO I figured it out. 18.16 is the actual keycap width / height,
		whereas 19.01 is the unit. ISO enter obeys that just like everything else,
		which means that it's height is 18.16 * 2 + (19.01 - 18.16) or, two
		keycap heights plus the space between them, also known as 18.16 +
		(19.01 * (key_height - 1)). this is followed by the width too. should fix
		to make this finally work*/
    unit = 18.16; // TODO probably not

		// t is all modifications to the polygon array
		t = radius + thickness_difference/2;

    pointArray = [
        [0 + t,0 + t],
        [unit*1.25 - t, 0 + t],
        [unit*1.25  - t, unit*2  - t],
        [unit*-.25 + t, unit*2  - t],
        [unit*-.25 + t, unit*1  + t],
        [0 + t, unit*1  + t]
    ];

    minkowski(){
        circle(r=radius, $fn=24);
        polygon(points=pointArray);
    }
}

//corollary is shape_hull
module ISOEnterShapeHull(thickness_difference, depth_difference, modifier){
    unit = 18.16; // TODO probably not
		height = 8 - depth_difference;
		length = 1.5 * unit; // TODO not used. need for dish

    translate([-0.125 * unit, unit*.5]) linear_extrude(height=height*modifier, scale=[.8, .9]){
        translate([-unit*.5, -unit*1.5]) minkowski(){
            fakeISOEnter(thickness_difference);
        }
    }
}
