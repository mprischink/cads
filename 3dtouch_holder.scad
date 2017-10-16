
3dtouch_holder ();

module 3dtouch_holder ()
{
    height = 4  ;
    length_a = 28;
    length = 40 ;
    width= 9 ;
    half_width  = width / 2;
    
    length_b = 27;
    diff = 18;
    hole = 3;
    
    difference() {
	translate ([-length/2.0, -width/2, 0]) {
    	    cube ([length, width, height]);
	}

    // bohrung (h, bottom_r, top_r)
    radius = 1.75;
    radius_head = 3.5;
    
    translate ([length_a - length/2,0,2]) {
    	   # cylinder (2, radius,radius);
	}
    translate ([length_a - length/2,0,0]) {
    	   # cylinder (2, radius_head,radius_head);
	}
    
}

    difference() {
	translate ([-length_b - length/2 - height, -width/2, 0]) {
    	    cube ([length_b + height, width, 3* height]);
	}
    
    
	translate ([-length_b - length/2 - height, -width/2, 0]) {
    	    #cube ([length_b, width, 2* height]);
	}
    
    translate ([-length_b - length/2, 0, 2*height]) {
    	   # cylinder (height, hole/2,hole/2);
	}
        
    translate ([-length_b - length/2 + diff, 0, 2*height]) {
    	   # cylinder (height, hole/2,hole/2);
	}
}
}