// necessary constants
include <../metroxx-constants.scad>
// necessary lib
include <../../libs/solidpp/solidpp.scad>
// interafaces
use <link-interface.scad>
use <tunnel-interface.scad>
use <building-interface.scad>


// basic link tunnel
module __link_tunnel()
{
    // bottom
    mxx_tunnel_interface_inner();
    // top
    _z = mxx_hu;
    translate([0,0,_z])
    difference()
    {
        _size = [mxx_l_w,mxx_l_w,mxx_hu];
        _align = "z";
        cubepp(_size,align=_align);
        transform_to_spp(size = _size, align = _align, pos = "Z")
            building_hole();
    } 

}

// central part
module __link_center()
{

}

module __link_connection(is_left=false)
{
    _align = is_left ? "X" : "x";

}


// link module
module link(n_building_slots=mxx_n_tunnels)
{
    __link_tunnel();
}

// testing
link();