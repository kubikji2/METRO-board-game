// include solidpp
include <../../libs/solidpp/solidpp.scad>

// include constants
include <../metroxx-constants.scad>

// returns link interface connection heigh
function get_link_interface_connection_h() = mxx_hu - mxx_z_clrn;

// return link interface offset in z-axis
function get_link_interface_connection_z_off() = mxx_hu+mxx_z_clrn;

// inner (stump_like) interface module
module mxx_link_interface_inner()
{
    // stopper height
    _h = get_link_interface_connection_h();
    // stopper diameter
    _d = mxx_l_w - mxx_xy_clrn;

    // stump height
    _H = mxx_li_h;
    // stump diameter
    _D = mxx_li_d - mxx_xy_clrn;

    cylinder(h=_h,d=_d);
    cylinder(h=_H,d=_D);

}

// outer (ring-like) interface module
module mxx_link_interface_outer()
{
    _d = mxx_li_d + mxx_xy_clrn;
    _D = mxx_l_w - mxx_xy_clrn;
    _h = get_link_interface_connection_h();
    
    translate([0,0,mxx_hu+mxx_z_clrn])
    {
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
}

// TESTING
mxx_link_interface_inner();
mxx_link_interface_outer()
    cubepp([10,1,get_link_interface_connection_h()]);
