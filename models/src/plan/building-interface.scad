// include solidpp
include <../../libs/solidpp/solidpp.scad>

// include constants
include <../metroxx-constants.scad>

module mxx_building_hole()
{
    _mod_list = [round_edges(r=mxx_b_cr)];
    _size = add_vecs([mxx_b_a, mxx_b_a, mxx_b_h], [mxx_xy_clrn, mxx_xy_clrn, mxx_z_clrn]);
    
    translate([0,0,-mxx_b_h_off])
        cubepp(_size, align="z",mod_list=_mod_list);
}

// testing
difference()
{
    cubepp([20,20,3],align="Z");
    building_hole();
}