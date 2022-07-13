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

