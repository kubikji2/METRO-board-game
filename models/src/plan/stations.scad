include <../mxx_constants.scad>
include <../qpp_lib.scad>

module __station_name()
{
    _X = mxx_s_nl;
    _Y = mxx_l_w;
    _h = mxx_l_hu;
    _R = mxx_b_r+mxx_l_border;

    _b = mxx_l_border;
    _x = _X - 2*_b;
    _y = _Y - 2*_b;
    _r = mxx_b_r;
    
    difference()
    {
        // main shape
        qpp_cylindrocube([_X,_Y,_h,_R], $fn=mxx_fn);
        // cut
        translate([_b,_b,1])
        qpp_cylindrocube([_x,_y,_h,_r], $fn=mxx_fn);

    }
}

module __building_plateau(cols,rows=2)
{

    _x = cols*mxx_b_a + (cols+1)*mxx_l_border;
    _y = rows*mxx_b_a + (rows+1)*mxx_l_border;
    _z = mxx_l_hu;
    _r = mxx_b_r+mxx_l_border;

    difference()
    {
        qpp_cylindrocube([_x,_y,_z,_r], $fn=mxx_fn);
        for(ci=[0:cols-1])
        {
            _xtf = ci*(mxx_l_w-mxx_l_border);
            translate([_xtf,0,0])
                __building_hole();
            translate([_xtf,mxx_l_w-mxx_l_border,0])
                __building_hole();
        }
    }

    
}

module __building_hole()
{

    _h = mxx_l_hu;
    _a = mxx_l_w;
    _r = mxx_b_r;

    // building hole
    // centered to the left-down corrner      
    translate([_a/2,_a/2,_h])
        rotate([180,0,0])
            building_base_hole();

}

// station module
module station(size=4)
{
    // connector to the links
    // '-> height of the connector base
    _hc = mxx_l_hu-mxx_z_tol; 
    _cld = mxx_l_w-mxx_xy_tol;
    // '-> lower ring
    cylinder(h=_hc, d=_cld, $fn=mxx_fn);
    // '-> upper cylinder
    cylinder(h=mxx_s_ch, d=2*mxx_s_cr-mxx_xy_tol, $fn=mxx_fn);
    
    // cube from the link to the main body
    _ll = _cld/2 + mxx_l_w/2;
    translate([0,-mxx_s_cr, 0])
        cube([_ll,2*mxx_s_cr, _hc]);

    // main body
    _y_off = -1*mxx_l_w;
    translate([_ll,_y_off,0])
    {
        // '-> station name segment
        translate([0,2*mxx_l_w-mxx_l_border,0])
            __station_name();
        // '-> building grid
        __building_plateau(cols=size);
    }

}