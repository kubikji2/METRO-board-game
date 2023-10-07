// necessary constants
include <../metroxx-constants.scad>
// necessary lib
include <../../libs/solidpp/solidpp.scad>
// interafaces
use <link-interface.scad>
use <tunnel-interface.scad>
use <building-interface.scad>
use <danger-triangle-interface.scad>


function __link_get_center_size() = [mxx_l_ml, mxx_l_w, mxx_l_h];
function __link_get_tunnel_size() = [mxx_l_w, mxx_l_w, mxx_l_h-mxx_hu];

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
        _size = __link_get_tunnel_size();
        _align = "z";
        cubepp(_size,align=_align);
        transform_to_spp(size = _size, align = _align, pos = "Z")
            building_hole();
    } 

}

// central part
module __link_center()
{
    _size = __link_get_center_size();
    difference()
    {
        // base block
        cubepp(_size, align="z");
        
        // danger triangle part
        translate([0,0,mxx_l_h])
            danger_triangle_hole();

    }
}

module __link_connection()
{
    
}


// link module
module link(n_building_slots=mxx_n_tunnels)
{
    // center part
    __link_center();

    // tunnels
    _x_off = __link_get_center_size()[0]/2;
    _dx = __link_get_tunnel_size()[0];
    // replicate tunnels
    for(i=[0:2])
    {
        _cur_off = _x_off + _dx/2 + i*_dx;
        mirrorpp([1,0,0], true)
            translate([_cur_off,0,0])
                __link_tunnel();
    }

    // add connections

}

// testing
link();