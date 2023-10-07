// include solidpp
include <../../libs/solidpp/solidpp.scad>

// include constants
include <../metroxx-constants.scad>

// returns tunnel interface connection heigh
function get_tunnel_interface_connection_inner_h() = mxx_hu + mxx_z_clrn;

// returns tunnel interface connection heigh
function get_tunnel_interface_connection_outer_h() = mxx_hu - mxx_z_clrn;

// outer tunnel interface
module mxx_tunnel_interface_outer()
{

    _h = get_tunnel_interface_connection_inner_h();
    _d = mxx_ti_d + mxx_xy_clrn;
    _D = mxx_l_w - mxx_xy_clrn;

    difference()
    {
        union()
        {
            cylinderpp(d=_D, h=_h);
            children();
        }

        translate([0,0,-mxx_eps])
            cylinder(d=_d, h=_h+mxx_2eps+mxx_li_h);
    }
}

// inner tunnel interface
module mxx_tunnel_interface_inner()
{
    _h = get_tunnel_interface_connection_inner_h();
    _d = mxx_ti_d - mxx_xy_clrn;

    cylinder(d=_d, h=_h);
}

// TESTING 
mxx_tunnel_interface_inner();
mxx_tunnel_interface_outer()
    cubepp([10,1,get_tunnel_interface_connection_inner_h()]);
