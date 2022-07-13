include <../mxx_constants.scad>
include <../qpp_lib.scad>

// radiation symbol
// '-> using Q++
module radiation_symbol(r=mxx_s_r,h=mxx_s_h)
{
    qpp_radiation_symbol(r=r,h=h);
}

// biohazzard symbol
// '-> using Q++
module biohazard_symbol(r=mxx_s_r,h=mxx_s_h)
{
    qpp_biohazard_symbol(r=r,h=h);
}

// wierd combination of radiation and biohazzard
// '-> using Q++
module uknown_danger(r=mxx_s_r,h=mxx_s_h)
{
    difference() 
    {
        biohazard_symbol(r=r,h=h);
        translate([0, 0, -mxx_eps])
            radiation_symbol(r=r,h=h+mxx_2eps);
    }

    difference() 
    {
        radiation_symbol(r=r,h=h);
        translate([0, 0, -mxx_eps])
            biohazard_symbol(r=r,h=h+mxx_2eps);
    }

}
