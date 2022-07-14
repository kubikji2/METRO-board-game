include <../mxx_constants.scad>
include <../qpp_lib.scad>

// hole for the building
module __building_hole()
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
            sphere(r=1,$fn=mxx_fn);
    
    translate([0,+mxx_b_a/2,0])
        resize([_sx, _sy, _sz])
            sphere(r=1,$fn=mxx_fn);


}

// connectors to the stations
// '-> reversed switch the connector orientation from [1,0,0] to [-1,0,0]
module __link_connetor(reversed=false)
{
    _a = mxx_l_w;
    _t = mxx_l_hu-mxx_z_tol;
    _r = mxx_s_cr+mxx_xy_tol;
    // ring
    qpp_ring(h=_t,r=_r, D=_a, $fn=mxx_fn);

    difference()
    {
        _x_off = reversed ? _a/4 : -_a/4;
        translate([-_a/4 + _x_off,-_a/2,0])
            cube([_a/2,_a,_t]);
        
        translate([0,0,-mxx_eps])
            cylinder(r=_r, h=_t+mxx_2eps, $fn=mxx_fn);       
    }
}

// single link segment
// '-> has hole defines whether the segment has hole for the building and the connector for possible side tunnel
// '-> is higher defines whether the segment consists of three height unit, otherwise is just 2 units high 
module __link_segment(has_hole=true, is_higher=true)
{
    _huc = 1 + (is_higher ? 1 : 0) + (has_hole ? 0 : 1);
    _h = _huc*mxx_l_hu - (has_hole ? mxx_z_tol : 0);
    _a = mxx_l_w;
    
    qpp_difference(has_hole)
    {
        // main shape
        translate([-_a/2,-_a/2,0])
            cube([_a,_a,_h]);
        
        // cylindrocube for the building
        __building_hole();
        
    }   

    if (has_hole)
    {
        translate([0,0,_h])
            cylinder(r=mxx_t_r, h=mxx_l_hu + mxx_z_tol, $fn=mxx_fn);
    }

    //%translate([-_a/2,-_a/2, 0])
    //    cube([_a,_a,mxx_l_hu*(is_higher ? 3 : 2)]);

}

// segment for the danger triangle
// '-> centered in xy-plane
module __link_danger_segment(is_higher=true)
{
    _x = mxx_dt_l;
    _y = mxx_l_w;
    _huc = is_higher ? 3 : 2;
    _z = _huc*mxx_l_hu;

    _d = 2*mxx_dt_r + mxx_xy_tol;
    _h = mxx_dt_depth + mxx_z_tol + mxx_eps;
    
    difference()
    {
        translate([-_x/2,-_y/2,0])
            cube([_x,_y,_z]);

        translate([0,0,-mxx_eps])
            cylinder(d=_d, h=_h, $fn=mxx_fn);
    }
}

// destroyed terminal
module __link_destroyed()
{

}

// link connecting two stations
// '-> "left_len" is the number of segments associated with the left station
// '-> "right_len" is the number of segments associated with the left station
// '-> "left_holes" is the number of holes within the segment associated with the left station
// '-> "right_holes" is the number of holes within the segment associated with the right station
// '-> "thick" defines whethe
module link(left_len=3, right_len=2, left_holes=2, right_holes=1, thick=false)
{

    _max_idx = max([left_len,right_len]);

    // inner danger triangle sign
    __link_danger_segment(is_higher=thick);

    for(i=[0:_max_idx])
    {
        // translation from the center
        _off = mxx_dt_l/2 + mxx_l_w/2 + i*mxx_l_w;

        // left part
        translate([-_off,0,0])
        if (i<left_len)
        {
            __link_segment(has_hole=(i > left_len-left_holes-1), is_higher=thick);
        }
        else if (left_len==i)
        {
            __link_connetor(reversed=true);
        }

        // right part
        translate([+_off,0,0])
        if (i<right_len)
        {
            __link_segment(has_hole=(i > right_len-right_holes-1), is_higher=thick);
        }
        else if (right_len==i)
        {
            __link_connetor(reversed=false);
        }
    }

}