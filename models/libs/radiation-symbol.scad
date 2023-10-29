__mxx_lib_rad_eps = $preview ? 0.001 : 0;

// constants from law about biohazzard law:
// https://law.resource.org/pub/us/cfr/ibr/002/ansi.z35.1.1968.html

__mxx_lib_rad_Rf = 1;
__mxx_lib_rad_rf = 0.3;
__mxx_lib_rad__rf = 0.2;
__mxx_lib_rad_angles = [30,150,270];

// single radiation fin
module __mxx_lib_rad_fin(r, h)
{
    _d = 2*r;
    difference()
    {
        // basic shape
        cylinder(h=h, r=__mxx_lib_rad_Rf*r);
        // cut half of the circle off
        translate([0, -_d,-__mxx_lib_rad_eps])
            cube([_d,2*_d,h+2*__mxx_lib_rad_eps]);
        // cut 120° segment of circle
        rotate([0,0,120])
            translate([0, -_d,-__mxx_lib_rad_eps])
                cube([_d,2*_d,h+2*__mxx_lib_rad_eps]);
        // inner cut
        translate([0,0,-__mxx_lib_rad_eps])
            cylinder(h=h+2*__mxx_lib_rad_eps, r=__mxx_lib_rad_rf*r);
    }
}

// radiation symbol based on the US law
// '-> varible "r" or "d" defines symbol radius or diameter respectively
// '-> variable "h" define the height of the symbol
module mxx_radiation_symbol(r=0.5, d=undef, h=0.1)
{

    _module_name = "[MXX-radiation-symbol]";

    // radius/diameter
    _r = is_undef(d) ? r : d/2;
    assert(_r > 0, str(_module_name, " variable \"r\", neither \"d\" can be negative!"));

    // height
    _h = h;
    assert(_h >= 0, str(_module_name, " variable \"h\" cannot be negative!"));

    // radiation fins
    for (_a=__mxx_lib_rad_angles)
    {
        rotate([0,0,_a])
            __mxx_lib_rad_fin(_r,_h);
    }

    // inner cylinder
    rotate([0,0,30])
    cylinder(r=_r*__mxx_lib_rad__rf, _h);
    
}