include <../mxx_constants.scad>
include <../qpp_lib.scad>
include <buildings.scad>

module __station_name_plateau()
{
    _X = mxx_s_nl;
    _Y = mxx_l_w;
    _h = mxx_l_hu;
    _R = mxx_b_r+mxx_l_border;

    _b = mxx_l_border;
    _xy_off = _b + mxx_xy_tol/2;
    _x = _X - 2*_b+mxx_xy_tol;
    _y = _Y - 2*_b+mxx_xy_tol;
    _r = mxx_b_r;
    _h_off = _h-mxx_s_nt;
    
    difference()
    {
        // main shape
        qpp_cylindrocube([_X,_Y,_h,_R], $fn=mxx_fn);
        // cut
        translate([_xy_off,_xy_off,_h_off])
        qpp_cylindrocube([_x,_y,_h,_r], $fn=mxx_fn);

    }
}

// TODO make this multicolor
module station_name(name="Prazskaja", font_size = 7, clr="blue")
{

    _x = mxx_s_nl - 2*mxx_l_border;
    _y = mxx_l_w - 2*mxx_l_border;
    _z = mxx_s_nt;
    _r = mxx_b_r;
    color(clr)
        qpp_cylindrocube([_x,_y,_z,_r], $fn=mxx_fn);
    
    color("white")
    translate([_x/2,_y/2,_z])
        linear_extrude(_z)
            text(name,valign="center", halign="center", size = font_size);

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
            __station_name_plateau();
        // '-> building grid
        __building_plateau(cols=size,rows=2);
    }

}