// necessary constants
include <../metroxx-constants.scad>
// necessary lib
include <../../libs/solidpp/solidpp.scad>
// interafaces
use <link-interface.scad>

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
            cubepp(_size, align="z");
            __station_interface_cut();
        }

        // TODO adding hole for danger information
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
interchange_station_joint();