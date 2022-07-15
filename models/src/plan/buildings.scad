include <../mxx_constants.scad>
include <../qpp_lib.scad>


// building base without any graphics
module building_base(center=true)
{
    _t = center ? [-mxx_b_a/2,-mxx_b_a/2, 0] : [0,0,0];
    translate(_t)
        qpp_cylindrocube(size=[mxx_b_a, mxx_b_a, mxx_b_depth,mxx_b_r],$fn=mxx_fn);
}

// hole for the building
module building_base_hole()
{
    _a = mxx_b_a + mxx_xy_tol;

    // main shape for the building
    translate([-_a/2, -_a/2, -mxx_eps])
        qpp_cylindrocube([_a, _a, mxx_b_depth, mxx_b_r+mxx_eps],$fn=mxx_fn);

    // ellypsoid holes for better building removing
    _sx = mxx_b_a-2*mxx_b_r;
    _sy = 1.5*mxx_b_depth;
    _sz = mxx_b_depth;

    translate([0,-mxx_b_a/2,0])
        resize([_sx, _sy, _sz])
            sphere(r=1,$fn=60);
    
    translate([0,+mxx_b_a/2,0])
        resize([_sx, _sy, _sz])
            sphere(r=1,$fn=60);

}