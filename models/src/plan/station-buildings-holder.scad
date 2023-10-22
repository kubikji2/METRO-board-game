// include solidpp
include <../../libs/solidpp/solidpp.scad>

// include constants
include <../metroxx-constants.scad>

// interfaces
use <link-interface.scad>
use <building-interface.scad>


// station interface offset
function get_station_buildings_interface_offset() = mxx_bi_l_off + mxx_l_w/2;


// interface between the station/link and the main block
module __station_building_interface()
{
    _x = get_station_buildings_interface_offset() + mxx_b_cr + mxx_bw;
    _y = mxx_sl_w;
    _z = get_link_interface_connection_h();
    _size = [_x, _y, _z];
    mxx_link_interface_outer()
        cubepp(_size, align="xz");

}


// main block for holding the station
module __station_building_area(n_cols, n_rows)
{
    _x = n_cols*(mxx_b_a+mxx_bw) + mxx_bw;
    _y = n_rows*(mxx_b_a+mxx_bw) + mxx_bw;
    _z = mxx_b_h;
    _size = [_x, _y, _z];
    _mod_list = [round_edges(r=mxx_b_cr+mxx_bw)];

    cubepp(_size, align="xz", mod_list=_mod_list);
}


module station_buildings_holder(n_cols, n_rows=2)
{   
    difference()
    {
        _t = [get_station_buildings_interface_offset(),0,0];
        union()
        {
            // TODO fix the z-offset
            translate([0,0,mxx_hu]) 
                __station_building_interface();
            translate(_t)
                __station_building_area(n_cols=n_cols, n_rows=n_rows);
        }

        // holes
        translate(_t)
        for(xi=[0:n_cols-1])
        {
            for(yi=[0:n_rows-1])
            {
                _xo = mxx_b_a/2+mxx_bw + xi*(mxx_bw+mxx_b_a);
                _yo = (n_rows*(mxx_b_a+mxx_bw) + mxx_bw)/2 - mxx_b_a/2 - mxx_bw - yi*(mxx_b_a+mxx_bw);
                _zo = mxx_b_h;
                _off = [_xo, _yo, _zo];
                translate(_off)
                    mxx_building_hole();                    
            }
        }
    }


}


// testing
station_buildings_holder(5);