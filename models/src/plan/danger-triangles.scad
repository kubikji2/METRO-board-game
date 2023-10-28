// include solidpp
include <../../libs/solidpp/solidpp.scad>

// include constants
include <../metroxx-constants.scad>

// include interface
use <danger-triangle-interface.scad>

// triangular body
module __danger_triangle_body()
{

    points = [for (i=[0:2]) rotate_2D_z([mxx_dt_d/2,0], i*120)];
    linear_extrude(mxx_dt_h)
        offset(r=mxx_dt_cr)
            polygon(points);

}

// possible triangle symbols are managed here
module __danger_triangle_symbol(symbol)
{
    // TODO manage symbolss
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
        __danger_triangle_symbol(symbol=symbol);
    }
    
    // adding interfaces
    mxx_danger_triangle_stump();
    
}

// testing
danger_triangle("");