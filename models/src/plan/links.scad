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
module __link_segment(has_hole=true, is_higher=false)
{

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