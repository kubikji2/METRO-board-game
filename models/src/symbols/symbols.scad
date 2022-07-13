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
    %cylinder(r=r,h=h);
    _lf = 0.8;
    _tf = 0.1;
    _nd_f = 0.15;
    _d = 2*r;
    l = _lf*_d;
    t = _tf*_d;
    nut_d = _nd_f*_d;
    d = nut_d*1.5;

    rotate([0,0,-45])
    translate([-l/2,0,0])
    difference()
    {
        // body
        union()
        {
            // main enlargement
            cylinder(d=d,h=h,$fn=$fn);
            // handle
            translate([0,-t/2,0]) cube([l,t,h]);
            // optional secondary enlargement
            if (double_sided)
            {
                translate([l,0,0]) cylinder(d=d,h=h,$fn=$fn);    
            }
            // circular handle end
            translate([l,0,0]) cylinder(d=t,h=h,$fn=$fn);
        }

        // front bolt-head hole
        translate([-nut_d/2,0,-mxx_eps]) 
            cylinder(d=nut_d,h=h+mxx_2eps, $fn = 6);
        translate([-nut_d/4,0,-mxx_eps])
            cylinder(d=nut_d,h=h+mxx_2eps, $fn = 6);

        // back bolt-head hole        
        if (double_sided)
        {
        translate([l+nut_d/2,0,-mxx_eps]) 
            cylinder(d=nut_d,h=h+mxx_2eps, $fn = 6);
        translate([l+nut_d/4,0,-mxx_eps])
            cylinder(d=nut_d,h=h+mxx_2eps, $fn = 6);
        }
    }
}
