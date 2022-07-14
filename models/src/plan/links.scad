include <../mxx_constants.scad>
include <../qpp_lib.scad>

// hole for the building
module __building_hole()
{
    // main shape for the building

    // ellypsoid holes for better building removing

}

// connectors to the stations
// '-> orientation defines which direction is the station oriented
module __link_connetor()
{

}

// single link segment
// '-> has hole defines whether the segment has hole for the building and the connector for possible side tunnel
// '-> is higher defines whether the segment consists of three height unit, otherwise is just 2 units high 
module __link_segment(has_hole=true, is_higher=true)
{
    _huc = 1 + (is_higher ? 1 : 0) + (has_hole ? 0 : 1);
    _h = _huc*mxx_l_hu - (has_hole ? mxx_z_tol : 0);
    _a = mxx_l_w;
    _app = mxx_b_a + mxx_xy_tol;
    echo(str([_h,_huc]));

    qpp_difference(has_hole)
    {
        // main shape
        translate([-_a/2,-_a/2,0])
            cube([_a,_a,_h]);
        
        // cylindrocube for the building
        translate([-_app/2, -_app/2, -mxx_eps])
            qpp_cylindrocube([_app, _app, mxx_b_depth, mxx_b_r+mxx_eps],$fn=mxx_fn);
        
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
module __link_danger_segment()
{

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
module link(left_len=3, right_len=3, left_holes=2, right_holdes=1, thick=false)
{

}