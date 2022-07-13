include <../mxx_constants.scad>
include <../qpp_lib.scad>

echo(mxx_fn);

// building base without any graphics
module building_base(center=true)
{
    _t = center ? [-mxx_b_a/2,-mxx_b_a/2, 0] : [0,0,0];
    translate(_t)
        qpp_cylindrocube(size=[mxx_b_a, mxx_b_a, mxx_b_depth,mxx_b_r],$fn=mxx_fn);
}

building_base();
