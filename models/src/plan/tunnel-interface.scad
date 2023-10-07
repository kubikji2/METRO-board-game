// include solidpp
include <../../libs/solidpp/solidpp.scad>

// include constants
include <../metroxx-constants.scad>

// outer tunnel interface
module mxx_tunnel_interface_outer()
{

}

// inner tunnel interface
module mxx_tunnel_interface_inner()
{
    _h = mxx_hu;
    _d = mxx_ti_d - mxx_xy_clrn;

    cylinder(d=_d, h=_h);
}

