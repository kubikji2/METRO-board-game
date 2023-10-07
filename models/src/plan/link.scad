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
function __link_get_tunnel_size() = [mxx_l_w, mxx_l_w, mxx_l_h - get_tunnel_interface_connection_inner_h()];

// basic link tunnel
module __link_tunnel()
{
    // bottom
    mxx_tunnel_interface_inner();
    // top
    _z = get_tunnel_interface_connection_inner_h();
    translate([0,0,_z])
    difference()
    {
        _size = __link_get_tunnel_size();
        _align = "z";
        cubepp(_size,align=_align);
        transform_to_spp(size = _size, align = _align, pos = "Z")
            mxx_building_hole();
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
            mxx_danger_triangle_hole();

    }
}

module __link_connection()
{
    mxx_link_interface_outer()
        cubepp([mxx_l_w/2, mxx_l_w, get_link_interface_connection_h()], align="Xz");
}


// link module
module link(n_building_slots=mxx_n_tunnels)
{
    // center part
    __link_center();

    // tunnels
    _x_off = __link_get_center_size()[0]/2;
    _dx = __link_get_tunnel_size()[0];
    // replicate tunnel segments
    for(i=[0:n_building_slots-1])
    {
        _cur_off = _x_off + _dx/2 + i*_dx;
        mirrorpp([1,0,0], true)
            translate([_cur_off,0,0])
                __link_tunnel();
    }

    // add connections
    mirrorpp([1,0,0], true)
        translate([_x_off + _dx*(n_building_slots+0.5),0,0])
            __link_connection();

}

// TESTING
link();