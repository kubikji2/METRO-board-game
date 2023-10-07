// include solidpp
include <../../libs/solidpp/solidpp.scad>

// include constants
include <../metroxx-constants.scad>


module danger_triangle_hole()
{
    _d = mxx_dti_d + mxx_xy_clrn;
    _h = mxx_dti_h + mxx_z_clrn;

    translate([0,0,mxx_eps])
    {
        cylinderpp(d=_d, h=_h+2*mxx_eps, align="Z");
    }
}

