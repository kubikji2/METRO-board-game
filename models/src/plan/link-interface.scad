// include solidpp
include <../../libs/solidpp/solidpp.scad>

// include constants
include <../metroxx-constants.scad>

// inner (stump_like) interface module
module mxx_link_interface_inner(dir)
{
    // stopper height
    _h = mxx_hu - mxx_z_clrn;
    // stopper diameter
    _d = mxx_l_w - mxx_xy_clrn;

    // stump height
    _H = mxx_li_h;
    // stump diameter
    _D = mxx_li_d;

    cylinder(h=_h,d=_d);
    cylinder(h=_H,d=_D);    
}

// outer (ring-like) interface module
module mxx_link_interface_outer()
{

}

// TESTING
mxx_link_interface_inner();

