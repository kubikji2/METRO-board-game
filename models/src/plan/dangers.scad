include <../mxx_constants.scad>
include <../qpp_lib.scad>
include <../symbols/symbols.scad>


// just a danger triangle base
module base_triangle()
{   
    _h = mxx_dt_t;
    _r = mxx_dt_rr;
    _R = mxx_dt_sr;
    qpp_regular_cylindroprism(R=_R, h=_h, r=_r, n_sides=3, incircle=false, $fn=mxx_fn);
}

// separate geometry for the triangle connector
module danger_triangle_connector()
{
    _r = mxx_dt_cr;
    _h = mxx_dt_ch;
    cylinder(h=_h, r=_r, $fn=mxx_fn);
}

// danger triangle for the links
// '-> danger type is the name of the danger
// TODO: make it multimaterial
module danger_triangle(danger_type=MXX_DT_DANGER)
{   
    $fn=mxx_fn;

    difference()
    {
        // base
        base_triangle();
        
        // hole for the connector
        translate([0,0,-mxx_eps])
            cylinder(r=mxx_dt_cr,h=mxx_dt_cdepth+mxx_eps);
    }

    // add danger symbol
    color([0.25,0.25,0.25])
    translate([0,0,mxx_dt_t])
    //render()
    union()
    {
        // MXX_DT_BIOHAZARD = "biohazard"
        if (danger_type==MXX_DT_BIOHAZARD)
        {
            biohazard_symbol(r=mxx_dt_sr,h=mxx_dt_st);
        }

        // MXX_DT_RADIATION = "radiation"
        if (danger_type==MXX_DT_RADIATION)
        {
            radiation_symbol(r=mxx_dt_sr,h=mxx_dt_st);
        }

        // MXX_DT_ANOMALY   = "anomaly"
        if (danger_type==MXX_DT_ANOMALY)
        {
            mental_anomaly_symbol(r=mxx_dt_sr,h=mxx_dt_st);
        }

        // MXX_DT_OTHER     = "other";
        if (danger_type==MXX_DT_OTHER)
        {
            uknown_danger_symbol(r=mxx_dt_sr,h=mxx_dt_st);
        }

        // MXX_DR_UKNOWN    = "uknown";
        if (danger_type==MXX_DT_UKNOWN)
        {
            uknown_danger(r=mxx_dt_sr,h=mxx_dt_st);
        }

        // MXX_DT_DANGER    = "danger";
        if (danger_type==MXX_DT_DANGER)
        {
            danger_symbol(r=mxx_dt_sr,h=mxx_dt_st);
        }
    }

}