$fn=100;

CASE_FASTENER_BOSS_RADIUS = 3; //M3 -
CASE_FASTENER_INTERNAL_RADIUS = 1.5-(0.25/2); //M3 -> enough for self tapping
CASE_FASTENER_DEPTH = 12;

LID_FASTENER_RADIUS = 1.5;

pcbX = 37.25 + CASE_FASTENER_BOSS_RADIUS/2;
pcbZ = 20.20 + CASE_FASTENER_BOSS_RADIUS/2;
pcbY = 20;

WALL_THICKNESS = 5; // 2mm minimum is recommended
radius = 5;

pcbOffsetx = pcbX;
pcbOffsetz = 5;
pcbOffsety = 2;

FASTENER_HEAD_RADIUS = 2.8;


//Floor plane...
difference(){
translate([0,0,+WALL_THICKNESS/2]){
    minkowski()
    {

            cube([pcbX+(WALL_THICKNESS*2)-radius,pcbZ+(WALL_THICKNESS*2)-radius,WALL_THICKNESS],center=true);
            cylinder(h=0.000000000000001,r=radius);
    }
}

union(){
    translate([pcbX/2 + CASE_FASTENER_BOSS_RADIUS/2,pcbZ/2 + CASE_FASTENER_BOSS_RADIUS/2, WALL_THICKNESS/2])
    {
        cylinder(h=WALL_THICKNESS+0.1, r=LID_FASTENER_RADIUS, center=true);
        translate([0,0, 1.5])
        {
            cylinder(h=3, r=FASTENER_HEAD_RADIUS, center=true);
        }
    }
    translate([pcbX/2 + CASE_FASTENER_BOSS_RADIUS/2,-(pcbZ/2 + CASE_FASTENER_BOSS_RADIUS/2),WALL_THICKNESS/2])
    {
        cylinder(h=WALL_THICKNESS+0.1, r=LID_FASTENER_RADIUS, center=true);
        translate([0,0, 1.5])
        {
            cylinder(h=3, r=FASTENER_HEAD_RADIUS, center=true);
        }
    }
    translate([-(pcbX/2 + CASE_FASTENER_BOSS_RADIUS/2),-(pcbZ/2 + CASE_FASTENER_BOSS_RADIUS/2),WALL_THICKNESS/2])
    {
        cylinder(h=WALL_THICKNESS+0.1, r=LID_FASTENER_RADIUS, center=true);
        translate([0,0, 1.5])
        {
            cylinder(h=3, r=FASTENER_HEAD_RADIUS, center=true);
        }    }
    translate([-(pcbX/2 + CASE_FASTENER_BOSS_RADIUS/2),pcbZ/2 + CASE_FASTENER_BOSS_RADIUS/2,WALL_THICKNESS / 2])
    {
        cylinder(h=WALL_THICKNESS+0.1, r=LID_FASTENER_RADIUS, center=true);
        translate([0,0, 1.5])
        {
            cylinder(h=3, r=FASTENER_HEAD_RADIUS, center=true);
        }    }
}
}





translate([80,0,0]){

    // Sides....
    difference(){
       

        
        
        difference() {  
            
            translate([0,0,pcbY/2+WALL_THICKNESS])
            {
                cube([pcbX+(WALL_THICKNESS*2)-radius,pcbZ+(WALL_THICKNESS*2)-radius,pcbY],center = true);

                minkowski()
                {

                        cube([pcbX+(WALL_THICKNESS*2)-radius,pcbZ+(WALL_THICKNESS*2)-radius,pcbY],center = true);
                        cylinder(h=0.000000000000001,r=radius);
                }
            }
         
            // Internal Cube 
            translate([0,0,pcbY/2+WALL_THICKNESS])
            {
                minkowski()
                {
                  
                      cube([pcbX,pcbZ,pcbY+0.01], center = true);
                      cylinder(h=0.000000000000001,r=1);
                }
            }

        }
        
        union()
        {
            translate([pcbX/2 + CASE_FASTENER_BOSS_RADIUS/2,pcbZ/2 + CASE_FASTENER_BOSS_RADIUS/2,pcbY/2 + WALL_THICKNESS])
            {
                
                cylinder(h=pcbY + 0.01, r=CASE_FASTENER_INTERNAL_RADIUS, center=true);
            }
            translate([pcbX/2 + CASE_FASTENER_BOSS_RADIUS/2,-(pcbZ/2 + CASE_FASTENER_BOSS_RADIUS/2),pcbY/2 + WALL_THICKNESS])
            {
                
                cylinder(h=pcbY + 0.01, r=CASE_FASTENER_INTERNAL_RADIUS, center=true);
            }
            
            translate([-(pcbX/2 + CASE_FASTENER_BOSS_RADIUS/2),-(pcbZ/2 + CASE_FASTENER_BOSS_RADIUS/2),pcbY/2 + WALL_THICKNESS])
            {
                
                cylinder(h=pcbY + 0.01, r=CASE_FASTENER_INTERNAL_RADIUS, center=true);
            }
                 translate([-(pcbX/2 + CASE_FASTENER_BOSS_RADIUS/2),(pcbZ/2 + CASE_FASTENER_BOSS_RADIUS/2),pcbY/2 + WALL_THICKNESS])
            {
                
                cylinder(h=pcbY + 0.01, r=CASE_FASTENER_INTERNAL_RADIUS, center=true);
            }
            

        }

    }

    //Floor plane...
    translate([0,0,+WALL_THICKNESS/2])
    {
        minkowski()
        {

                cube([pcbX+(WALL_THICKNESS*2)-radius,pcbZ+(WALL_THICKNESS*2)-radius,WALL_THICKNESS],center=true);
                cylinder(h=0.000000000000001,r=radius);
        }
    }



    // PCB offsets
    translate([0,pcbZ/2-pcbOffsetz/2 + CASE_FASTENER_BOSS_RADIUS/2,pcbOffsety/2+WALL_THICKNESS])
    {
        cube([pcbOffsetx + CASE_FASTENER_INTERNAL_RADIUS/2,pcbOffsetz,pcbOffsety],center=true);
    }


    // PCB offsets
    translate([0,-pcbZ/2+pcbOffsetz/2 - CASE_FASTENER_BOSS_RADIUS/2,pcbOffsety/2+WALL_THICKNESS])
    {
        cube([pcbOffsetx + CASE_FASTENER_INTERNAL_RADIUS/2,pcbOffsetz,pcbOffsety],center=true);
    }



    translate([pcbX/2 + CASE_FASTENER_BOSS_RADIUS/2,pcbZ/2 + CASE_FASTENER_BOSS_RADIUS/2,pcbY/2 + WALL_THICKNESS/2])
    {
        difference() {
            cylinder(h=pcbY + WALL_THICKNESS - 0.01, r=CASE_FASTENER_BOSS_RADIUS, center=true);
            translate([0,0,pcbY/2+ CASE_FASTENER_DEPTH/2]){
                cylinder(h=CASE_FASTENER_DEPTH * 2, r=CASE_FASTENER_INTERNAL_RADIUS, center=true);
            }
        }

    }
    translate([pcbX/2 + CASE_FASTENER_BOSS_RADIUS/2,-(pcbZ/2 + CASE_FASTENER_BOSS_RADIUS/2),pcbY/2 + WALL_THICKNESS/2])
    {
        difference() {
            cylinder(h=pcbY + WALL_THICKNESS - 0.01, r=CASE_FASTENER_BOSS_RADIUS, center=true);
            translate([0,0,pcbY/2 + CASE_FASTENER_DEPTH/2]){
                cylinder(h=CASE_FASTENER_DEPTH * 2, r=CASE_FASTENER_INTERNAL_RADIUS, center=true);
            }
        }

    }
    translate([-(pcbX/2 + CASE_FASTENER_BOSS_RADIUS/2),-(pcbZ/2 + CASE_FASTENER_BOSS_RADIUS/2),pcbY/2 + WALL_THICKNESS/2])
    {
        difference() {
            cylinder(h=pcbY + WALL_THICKNESS - 0.01, r=CASE_FASTENER_BOSS_RADIUS, center=true);
            translate([0,0,pcbY/2 + CASE_FASTENER_DEPTH/2]){
                cylinder(h=CASE_FASTENER_DEPTH * 2, r=CASE_FASTENER_INTERNAL_RADIUS, center=true);
            }
        }

    }
    translate([-(pcbX/2 + CASE_FASTENER_BOSS_RADIUS/2),pcbZ/2 + CASE_FASTENER_BOSS_RADIUS/2,pcbY/2 + WALL_THICKNESS / 2])
    {
        difference() {
            cylinder(h=pcbY + WALL_THICKNESS - 0.01, r=CASE_FASTENER_BOSS_RADIUS, center=true);
            translate([0,0,pcbY/2 + CASE_FASTENER_DEPTH/2]){
                cylinder(h=CASE_FASTENER_DEPTH * 2, r=CASE_FASTENER_INTERNAL_RADIUS, center=true);
            }
        }
    }
}



