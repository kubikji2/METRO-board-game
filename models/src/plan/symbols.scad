// metro constants
include <../metroxx-constants.scad>

// biohazard and radiation symbols
use <../../libs/biohazard-symbol.scad>
use <../../libs/radiation-symbol.scad>


// radiation symbol
module radiation_symbol(d=mxx_dt_s_d, h=mxx_dt_s_h)
{
    mxx_radiation_symbol(d=d, h=h);
}


// biohazard symbol
module biohazard_symbol(d=mxx_dt_s_d, h=mxx_dt_s_h)
{
    mxx_biohazard_symbol(d=d, h=h);
}


// wierd combination of radiation and biohazard
module combined_danger_symbol(d=mxx_dt_s_d, h=mxx_dt_s_h)
{
    difference() 
    {
        biohazard_symbol(d=d, h=h);
        translate([0, 0, -mxx_eps])
            radiation_symbol(d=d, h=h+mxx_2eps);
    }

    difference() 
    {
        radiation_symbol(d=d, h=h);
        translate([0, 0, -mxx_eps])
            biohazard_symbol(d=d, h=h+mxx_2eps);
    }

}


// mental anomaly symbol a.k.a. capital greek Psi
module psychological_danger_symbol(d=mxx_dt_s_d, h=mxx_dt_s_h)
{

    _fs = 0.75*d;
    
    translate([0,-0.1*d,0])
        linear_extrude(h)
            text("\u03A8",font = "Times New Roman:style=Bold", size = _fs, halign = "center", valign = "center");
    
}


// uknown danger symbol a.k.a. question mark
// '-> "r" is radius
// '-> "h" is height
// '-> "$fn" is just $fn
module uknown_danger_symbol(d=mxx_dt_s_d, h=mxx_dt_s_h)
{

    _fs = 0.95*d;

    translate([0,-0.025*d,0])
        linear_extrude(h)
            text("?",font = "Times New Roman:style=Bold", size = _fs, halign = "center", valign = "center");
}


// danger symbol a.k.a exclamation mark
// '-> "r" is radius
// '-> "h" is height
// '-> "$fn" is just $fn
module danger_symbol(d=mxx_dt_s_d, h=mxx_dt_s_h)
{

    _fs = 0.95*d;

    translate([0,-0.025*d,0])
        linear_extrude(h)
            text("!",font = "Times New Roman:style=Bold", size = _fs, halign = "center", valign = "center");
}


/*
// spanner symbol
// '-> "r" is radius
// '-> "h" is height
// '-> "$fn" is just $fn
// '-> "double_sided"=true add second head
module spanner_symbol(r=mxx_s_r,h=mxx_s_h,fn=$fn,double_sided=false)
{
    // parameters
    _lf = 0.8;
    _tf = 0.1;
    _nd_f = 0.15;
    _hdf = _nd_f*1.5;

    // avaliable diameter
    _D = 2*r;

    // scaled paremeters
    _l = _lf*_D;
    _t = _tf*_D;
    _nd = _nd_f*_D;
    _d = _hdf*_D;

    rotate([0,0,-45])
    translate([-_l/2,0,0])
    difference()
    {
        // body
        union()
        {
            // main enlargement
            cylinder(d=_d,h=h,$fn=fn);
            // handle
            translate([0,-_t/2,0]) cube([_l,_t,h]);
            // optional secondary enlargement
            if (double_sided)
            {
                translate([_l,0,0]) cylinder(d=_d,h=h,$fn=fn);    
            }
            // circular handle end
            translate([_l,0,0]) cylinder(d=_t,h=h,$fn=fn);
        }

        // front bolt-head hole
        translate([-_nd/2,0,-mxx_eps]) 
            cylinder(d=_nd,h=h+mxx_2eps, $fn = 6);
        translate([-_nd/4,0,-mxx_eps])
            cylinder(d=_nd,h=h+mxx_2eps, $fn = 6);

        // back bolt-head hole        
        if (double_sided)
        {
        translate([l+_nd/2,0,-mxx_eps]) 
            cylinder(d=_nd,h=h+mxx_2eps, $fn = 6);
        translate([l+_nd/4,0,-mxx_eps])
            cylinder(d=_nd,h=h+mxx_2eps, $fn = 6);
        }
    }
}
*/
