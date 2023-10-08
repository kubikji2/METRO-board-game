// necessary constants
include <../metroxx-constants.scad>
// necessary lib
include <../../libs/solidpp/solidpp.scad>
// interafaces
use <station-label-interface.scad>

// station label
module station_label(txt, is_txt=false)
{
    difference()
    {   
        if (!is_txt)
        {
            station_label_baseplate();
        }

        translate([0,0,mxx_sl_h-mxx_sl_txt_h/2])
            linear_extrude(mxx_sl_txt_h+mxx_eps)
                text(text=txt, halign="center", valign="center", font="FreeMono:style=Bold");
    }
    
}

// testing
station_label("VDChN", true);
