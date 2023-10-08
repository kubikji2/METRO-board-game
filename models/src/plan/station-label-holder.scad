// necessary constants
include <../metroxx-constants.scad>
// necessary lib
include <../../libs/solidpp/solidpp.scad>
// interafaces
use <link-interface.scad>
use <station-label-interface.scad>

// tunnel interface offset
function get_station_label_interface_offset() = mxx_sli_l_off + mxx_l_w/2;

// station label interface to the link
module __station_label_interface()
{
    _x = get_station_label_interface_offset() + mxx_b_cr + mxx_bw;
    _y = mxx_sl_w;
    _z = get_link_interface_connection_h();
    _size = [_x, _y, _z];
    mxx_link_interface_outer()
        cubepp(_size, align="xz");
}

// station label module
module station_label_holder()
{
    _x = mxx_sl_l+2*mxx_bw;
    _y = mxx_sl_w + 2*mxx_bw;
    _z = mxx_sl_h;
    _size = [_x, _y, _z];
    
    difference()
    {
        union()
        {
            // interface
            translate([0,0,mxx_hu]) 
                __station_label_interface();

            // main block
            _mod_list = [round_edges(r=mxx_b_cr+mxx_bw)];
            translate([get_station_label_interface_offset(),0,0]) 
                cubepp(_size, mod_list=_mod_list, align="zx");

        }

        // drill hole for the station label
        translate([get_station_label_interface_offset()+_x/2,0,_z])
            station_label_hole();
    }   
}

// testing
station_label_holder();
