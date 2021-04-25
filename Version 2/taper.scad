$fn = 100;

difference()
{
    union()
    {
        rotate([90,0,0]){cylinder(h=140,r1=5,r2=5,center = true);};
        cube([20,30,20],center = true);

    }
    cube([3.4,3.4,50], center = true);   

}      

