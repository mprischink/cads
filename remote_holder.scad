// To use it, uncomment
remote_holder ();

module remote_holder ()
{
    height = 22  ;
    length = 84 ;
    width= 50.5 ;
    half_width  = width / 2;
    
    borders = 4; // 

    top_cube_length = length - 2 * borders;
    top_cube_width  = width - 2 * borders;
    top_cube_height = height - 2 * borders;  // make it big enough
    top_z = height/2 ; // adjust manually ;)

    tip_cut_pos = length/2 - 0.5;

    difference() {
	translate ([-length/2.0, -width/2, 0]) {
    	    cube ([length, width, height]);
	}

	// middle inset
	translate ([0, 0, top_z]) {
	    # cube ([top_cube_length - 2* borders,
		     top_cube_width,
		     top_cube_height],
		    center=true) ;
	}
    
    begin_curve_r = 7;
    translate ([length/2 - borders - begin_curve_r,width/2,borders + begin_curve_r]) {
    rotate([90,0,0])
    	   # cylinder (width, begin_curve_r,begin_curve_r);
	}
    
    // top inset
	translate ([-2*borders, 0, top_z + borders]) {
	    # cube ([top_cube_length,
		     top_cube_width - 1* borders,
		     top_cube_height],
		    center=true) ;
	}
    
    // cut edges on holding clips
	translate ([-length/2, width/2-borders, height]) {
    	   # polyhedron (	
        // 0. li vo oben, 1. li vo unten, 2. 
	    		points = [[0,0,0], [0,-borders,0], [0,-borders,-borders], [length,0,0], [length,-borders,0], [length,-borders,-borders]],
                faces = [[0,1,2], [2,1,4,5], [5,4,3], [4,1,0,3],[3,0,2,5]]);
	}
    // cut edges on holding clips
	translate ([-length/2, -width/2+borders, height]) {
    	   # polyhedron (	
        // 0. li vo oben, 1. li vo unten, 2. 
	    		points = [[0,0,0], [0,borders,0], [0,borders,-borders], [length,0,0], [length,borders,0], [length,borders,-borders]],
                faces = [[0,1,2], [2,1,4,5], [5,4,3], [4,1,0,3],[3,0,2,5]]);
	}
    
    // bohrung (h, bottom_r, top_r)
    
    translate ([0,0,0]) {
    	   # cylinder (2, 3,3);
	}
    translate ([0,0,2]) {
    	   # cylinder (2, 3,5);
	}
    
    // re unten
    translate ([length/2 - length/2.8,-width/2,0]) {
        # cube ([length/2.8, width/4,height]);
	}
    
    // re oben
    translate ([length/2 - length/2.8,width/4,0]) {
        # cube ([length/2.8, width/4,height]);
	}
        
    // li unten
    translate ([-length/2.0,-width/2,0]) {
        # cube ([length/2.6, width/4,height]);
	}
    
    // li oben
    translate ([-length/2.0,width/4,0]) {
        # cube ([length/2.6, width/4,height]);
	}
    
    // top clamp shortener
    translate ([-length/2.0,-width/2,1.5*borders]) {
        # cube ([borders, width,borders]);
	}
        
    end_curve_r = 7.5;
    
    translate ([-length/2 + end_curve_r-1,width/2,borders + end_curve_r]) {
    rotate([90,0,0])
    	   # cylinder (width, end_curve_r,end_curve_r);
	}
    }
}