__mxx_lib_bio_eps = $preview ? 0.001 : 0;

// constants from law about biohazzard law:
// https://law.resource.org/pub/us/cfr/ibr/002/ansi.z35.1.1968.html
__mxx_lib_bio_A = 1;
__mxx_lib_bio_B = 3.5;
__mxx_lib_bio_C = 4;
__mxx_lib_bio_D = 6;
__mxx_lib_bio_E = 11;
__mxx_lib_bio_F = 15;
__mxx_lib_bio_G = 21;
__mxx_lib_bio_H = 30;
__mxx_lib_bio_angles = [90,210,330];


// base body of "tentacles" pair
module __mxx_lib_bio_tentacle_pair_base(sf=1, h=1, fn=$fn)
{
    _C = sf*__mxx_lib_bio_C;
    _E = sf*__mxx_lib_bio_E;
    _G = sf*__mxx_lib_bio_G;
    _H = sf*__mxx_lib_bio_H;

    difference(){
        translate([_E,0,0])
            cylinder(d=_H, h=h, $fn=fn);
        // the outer most cubioid cuts
        translate([_G,0,0-__mxx_lib_bio_eps])
            translate([_C/2,-_C/2,0])
                cube([_C,_C,h+2*__mxx_lib_bio_eps]);
    }
}


// the all six "tentacles" cut
module __mxx_lib_bio_tentacles_cut(sf=1, h=1, fn=$fn)
{
    _F = sf*__mxx_lib_bio_F;
    _G = sf*__mxx_lib_bio_G;

    for (_a=__mxx_lib_bio_angles)
    {
        rotate([0,0,_a])
            translate([_F,0,-__mxx_lib_bio_eps])
                cylinder(d=_G,h=h+__mxx_lib_bio_eps,$fn=fn);
    }
}


// all six "tentacles"
module __mxx_lib_bio_tentacles_base(sf=1 ,h=1, fn=$fn)
{
    for (_a=__mxx_lib_bio_angles)
    {
        rotate([0,0,_a])
            __mxx_lib_bio_tentacle_pair_base(sf,h,fn);
    }
}


// finalized outer part consisting of six "tentacles"
module __mxx_lib_bio_tentacles(sf=1, h=1, fn=$fn)
{
    difference()
    {
        __mxx_lib_bio_tentacles_base(sf,h,fn);
        __mxx_lib_bio_tentacles_cut(sf,h+2*__mxx_lib_bio_eps,fn);
    }
}

// cut in the logo center
module __mxx_lib_bio_inner_cut(sf=1, h=1, fn=$fn)
{   
    _A = sf*__mxx_lib_bio_A;
    _D = sf*__mxx_lib_bio_D;

    translate([0,0,-__mxx_lib_bio_eps])
        cylinder(d=_D,h=h,$fn=fn);
    
    for (_a=__mxx_lib_bio_angles)
    {
        rotate([0,0,_a-90])
            translate([-_A/2,0,-__mxx_lib_bio_eps])
                cube([_A,_D,h]);
    }
}


// annulus, kinda generic modul
module __mxx_lib_bio_annulus(sf=1, h=1, fn=$fn, dr=0)
{
    
    _A = sf*__mxx_lib_bio_A;
    _B = sf*__mxx_lib_bio_B;
    _E = sf*__mxx_lib_bio_E;

    _outer=_E-_A+_B+dr;
    _inner=_E-_A-dr;
    difference()
    {
        cylinder(r=_outer,h=h,$fn=fn);
        translate([0,0,-__mxx_lib_bio_eps])
            cylinder(r=_inner,h=h+2*__mxx_lib_bio_eps,$fn=fn);
    }
}

// finalized middle ring including cuts
module __mxx_lib_bio_middle_ring(sf=1, h=1, fn=$fn)
{

    _A = sf*__mxx_lib_bio_A;
    _F = sf*__mxx_lib_bio_F;
    _G = sf*__mxx_lib_bio_G;

    difference()
    {
        // from the middle ring...
        __mxx_lib_bio_annulus(sf,h,fn);

        // ... cut the segments next to the tentacles
        render()
        difference()
        {   
            // ... first take middle ring, saled up a bit
            translate([0,0,-__mxx_lib_bio_eps])
                __mxx_lib_bio_annulus(sf,h+2*__mxx_lib_bio_eps,fn,dr=__mxx_lib_bio_eps);
            
            // ... the cut the circles
            for(_a=__mxx_lib_bio_angles){
                rotate([0,0,_a])
                    translate([_F,0,-2*__mxx_lib_bio_eps])
                        cylinder(d=_G-2*_A,h=h+4*__mxx_lib_bio_eps,$fn=fn);
            }
        }
    }
}


// biohazard symbol based on the US law
// '-> variable "r" defines the total radius of the symbol
// '-> variable "h" defines the height of the logo
// '-> variable "$fn" is just regular $fn
module mxx_biohazard_symbol(r=0.5, d=undef, h=0.1, fn=$fn)
{
    
    _module_name = "[MXX-biohazard-symbol]";
    
    // radius/diameter
    _r = is_undef(d) ? r : d/2;
    assert(_r > 0, str(_module_name, " variable \"r\", neither \"d\" can be negative!"));
    _sf = _r/(__mxx_lib_bio_E+__mxx_lib_bio_H/2);
    
    // height
    _h = h;
    assert(_h >= 0, str(_module_name, " variable \"h\" cannot be negative!"));
    
    difference()
    {
        __mxx_lib_bio_tentacles(_sf,_h,fn);
        __mxx_lib_bio_inner_cut(_sf, _h+2*__mxx_lib_bio_eps,fn);
    }
    __mxx_lib_bio_middle_ring(_sf,_h,fn);

}


