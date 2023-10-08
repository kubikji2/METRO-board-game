// necessary constants
include <../metroxx-constants.scad>
// necessary lib
include <../../libs/solidpp/solidpp.scad>

// statioon label hole
module station_label_hole()
{
    _x = mxx_sl_l + mxx_xy_clrn;
    _y = mxx_sl_w + mxx_xy_clrn;
    _z = mxx_sl_h + mxx_z_clrn;
    _size = [_x, _y, _z];
    _mod_list = [round_edges(r=mxx_b_cr)];
    
    translate([0,0,-mxx_sl_h_off])
        cubepp(_size, align="z", mod_list=_mod_list);    

}