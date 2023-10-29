// include constants
include <../metroxx-constants.scad>

// use symbols
use <symbols.scad>


// danger triangle radiation symbol
module danger_triangle_radiation_symbol()
{
    radiation_symbol(d=mxx_dt_s_d, h=mxx_dt_s_h+0.001);
}


// danger triangle biohazard symbol
module danger_triangle_biohazard_symbol()
{
    biohazard_symbol(d=mxx_dt_s_d, h=mxx_dt_s_h+0.001);
}


// wierd combination of radiation and biohazard
module danger_triangle_combined_danger_symbol()
{
    combined_danger_symbol(d=mxx_dt_s_d, h=mxx_dt_s_h+0.001);
}


// mental anomaly symbol a.k.a. capital greek Psi
module danger_triangle_psychological_danger_symbol()
{
    psychological_danger_symbol(d=mxx_dt_s_d, h=mxx_dt_s_h);
}


// uknown danger symbol a.k.a. question mark
module danger_triangle_uknown_danger_symbol()
{
    uknown_danger_symbol(d=mxx_dt_s_d, h=mxx_dt_s_h);
}


// danger symbol a.k.a exclamation mark
module danger_triangle_danger_symbol()
{
    danger_symbol(d=mxx_dt_s_d, h=mxx_dt_s_h);
}   