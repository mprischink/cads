// To use it, uncomment
remote_holder ();

module remote_holder ()
{
    height = 19  ;
    length = 82 ;
    width= 46 ;
    half_width  = width / 2;
    
    borders = 2; // 1 cm on each side

    top_cube_length = length - 2 * borders;
    top_cube_width  = width - 2 * borders;
    top_cube_height = height - 2 * borders;  // make it big enough
    top_z = height/2 ; // adjust manually ;)

    tip_cut_pos = length/2 - 0.5;

    difference() {
	translate ([-length/2.0, -width/2, 0]) {
    	    cube ([length, width, height]);
	}

	// top inset
	translate ([-1 * borders, 0, top_z]) {
	    # cube ([top_cube_length,
		     top_cube_width,
		     top_cube_height],
		    center=true) ;
	}
    
    
	translate ([-length/2.0, width/2, height]) {
    	   # polyhedron (	
	    		points = [[0, 0, 0], [0,-1.5*borders, -borders], [0,-width + 1.5*borders,-borders],[0,-width,0], [length - 4*borders, 0, 0], [length - 4*borders,-1.5*borders, -borders], [length - 4*borders,-width + 1.5*borders,-borders],[length - 4*borders,-width,0]],
                faces = [[0,1,2,3], [1,5,4,0], [4,5,6,7], [3,7,6,2], [0,3,7,4], [1,2,6,5]]);
	}
    
    	translate ([0,0,0]) {
    	   # cylinder (3, 2,4.25);
	}
    
    translate ([length/6.0,-width/2,0]) {
        # cube ([length/3, width/4,height]);
	}
    
    translate ([length/6.0,width/4,0]) {
        # cube ([length/3, width/4,height]);
	}
        
    translate ([-length/2.0,-width/2,0]) {
        # cube ([length/3, width/4,height]);
	}
    
    translate ([-length/2.0,width/4,0]) {
        # cube ([length/3, width/4,height]);
	}
    }
    
}