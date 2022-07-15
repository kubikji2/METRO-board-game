include <../mxx_constants.scad>
include <../qpp_lib.scad>

module __building_plateau(cols,rows)
{

    _x = cols*mxx_b_a + (cols+1)*mxx_l_border;
    _y = rows*mxx_b_a + (rows+1)*mxx_l_border;
    _z = mxx_l_hu;
    _r = mxx_b_r+mxx_l_border;

    difference()
    {
        qpp_cylindrocube([_x,_y,_z,_r], $fn=mxx_fn);
        for(ci=[0:cols-1])
        {
            _xtf = ci*(mxx_l_w-mxx_l_border);
            for (ri=[0:rows-1])
            {
                _ytf = ri*(mxx_l_w-mxx_l_border);
                translate([_xtf,_ytf,0])
                    __building_hole();
            }
        }
    }    
}

module __building_hole()
{

    _h = mxx_l_hu;
    _a = mxx_l_w;
    _r = mxx_b_r;

    // building hole
    // centered to the left-down corrner      
    translate([_a/2,_a/2,_h])
        rotate([180,0,0])
            building_base_hole();

}


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