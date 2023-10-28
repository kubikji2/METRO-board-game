// necessary constants
include <../metroxx-constants.scad>
// necessary lib
include <../../libs/solidpp/solidpp.scad>
// interafaces
use <link-interface.scad>
use <danger-triangle-interface.scad>

module __station_interface_cut()
{

    cubepp([mxx_si_l, mxx_si_c, 4*get_link_interface_connection_h()], align="");
}

// regular stations joint
module regular_station_joint(has_cut=false)
{
    _l = mxx_si_l;
    _w = mxx_li_d;
    _z = get_link_interface_connection_h();
    _size = [_l,_w,_z];
    difference() 
    {
        // adding cut if requested
        difference_if(has_cut)
        {   
            union()
            {
                // link connections
                cubepp(_size, align="z");

                // danger triangle reinforcements
                cylinderpp(d=mxx_ti_d + 2*mxx_bw,h=_z);
            }
            __station_interface_cut();
        }

        // adding hole for danger information
        translate([0,0,_z]) 
            mxx_danger_triangle_hole();
    }

    // adding interface
    mirrorpp([1,0,0], true)
        translate([_l/2,0,0])
            mxx_link_interface_inner();

}


// interchange station joint
module interchange_station_joint()
{
    difference()
    {
        regular_station_joint(false);
        rotate([0,0,90]) 
            cubepp([2*mxx_li_d, mxx_si_c, 4*get_link_interface_connection_h()], align="");
    }
    
    
    rotate([0,0,90])
        regular_station_joint(true);
    
}

// TESTING
//interchange_station_joint();
regular_station_joint();