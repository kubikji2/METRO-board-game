// include solidpp
include <../../libs/solidpp/solidpp.scad>

// include constants
include <../metroxx-constants.scad>

// include interface
use <danger-triangle-interface.scad>

// include symbols
use <danger-triangle-symbols.scad>

// triangular body
module __danger_triangle_body()
{

    points = [for (i=[0:2]) rotate_2D_z([0,mxx_dt_d/2], i*120)];
    linear_extrude(mxx_dt_h)
        offset(r=mxx_dt_cr)
            polygon(points);

}

// possible triangle symbols are managed here
module danger_triangle_symbol(symbol)
{   
    translate([0,0,mxx_dt_h-mxx_dt_s_h+mxx_eps])
    // manage symbols
    if (symbol==DANGER_TRIANGLE_UKNOWN)
    {
        danger_triangle_uknown_danger_symbol();
    }
    else if (symbol==DANGER_TRIANGLE_DANGER)
    {
        danger_triangle_danger_symbol();   
    }
    else if (symbol==DANGER_TRIANGLE_BIOHAZARD)
    {
        danger_triangle_biohazard_symbol();
    }
    else if (symbol==DANGER_TRIANGLE_RADIATION)
    {
        danger_triangle_radiation_symbol();
    }
    else if (symbol==DANGER_TRIANGLE_PSYCHOLOGICAL)
    {
        danger_triangle_psychological_danger_symbol();
    }
    else if (symbol==DANGER_TRIANGLE_COMBINED)
    {
        danger_triangle_combined_danger_symbol();
    }
    

}


// danger triangle symbol
module danger_triangle(symbol)
{
    // body
    difference()
    {
        // main body
        __danger_triangle_body();
        
        // symbol cutout
        danger_triangle_symbol(symbol=symbol);
    }
    
    // adding interfaces
    mxx_danger_triangle_stump();
    
}

// testing
danger_triangle("");