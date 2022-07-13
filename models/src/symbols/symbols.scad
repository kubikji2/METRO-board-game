include <../mxx_constants.scad>
include <../qpp_lib.scad>

// radiation symbol
// '-> "r" is radius
// '-> "h" is height
// '-> "$fn" is just $fn
// NOTE: using Q++
module radiation_symbol(r=mxx_s_r,h=mxx_s_h,$fn=mxx_fn)
{
    qpp_radiation_symbol(r=r,h=h,$fn=$fn);
}

// biohazard symbol
// '-> "r" is radius
// '-> "h" is height
// '-> "$fn" is just $fn
// NOTE: using Q++
module biohazard_symbol(r=mxx_s_r,h=mxx_s_h,$fn=mxx_fn)
{
    qpp_biohazard_symbol(r=r,h=h,$fn=$fn);
}

// wierd combination of radiation and biohazard
// '-> "r" is radius
// '-> "h" is height
// '-> "$fn" is just $fn
// NOTE: using Q++
module uknown_danger(r=mxx_s_r,h=mxx_s_h,$fn=mxx_fn)
{
    difference() 
    {
        biohazard_symbol(r=r,h=h,$fn=$fn);
        translate([0, 0, -mxx_eps])
            radiation_symbol(r=r,h=h+mxx_2eps,$fn=$fn);
    }

    difference() 
    {
        radiation_symbol(r=r,h=h,$fn=$fn);
        translate([0, 0, -mxx_eps])
            biohazard_symbol(r=r,h=h+mxx_2eps,$fn=$fn);
    }

}

// spanner symbol
// '-> "r" is radius
// '-> "h" is height
// '-> "$fn" is just $fn
// '-> "double_sided"=true add second head
module spanner_symbol(r=mxx_s_r,h=mxx_s_h,$fn=mxx_fn,double_sided=false)
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
            cylinder(d=_d,h=h,$fn=$fn);
            // handle
            translate([0,-_t/2,0]) cube([_l,_t,h]);
            // optional secondary enlargement
            if (double_sided)
            {
                translate([_l,0,0]) cylinder(d=_d,h=h,$fn=$fn);    
            }
            // circular handle end
            translate([_l,0,0]) cylinder(d=_t,h=h,$fn=$fn);
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


// mental anomaly symbol a.k.a. capital greek Psi
// '-> "r" is radius
// '-> "h" is height
// '-> "$fn" is just $fn
module mental_anomaly_symbol(r=mxx_s_r,h=mxx_s_h,$fn=mxx_fn)
{

    %cylinder(r=r,h=h);

    _d = 2*r;
    _fs = 0.75*_d;
    
    translate([0,-0.1*_d,0])
        color([0.25,0.25,0.25])
            linear_extrude(h)
                text("\u03A8",font = "Times New Roman:style=Bold", size = _fs, halign = "center", valign = "center");
    
}