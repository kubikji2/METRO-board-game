// include solidpp
include <../../libs/solidpp/solidpp.scad>

// include constants
include <../metroxx-constants.scad>

// interfaces
use <tunnel-interface.scad>

// tunnel interface offset
function get_tunnel_interface_offset() = mxx_ti_l_off + mxx_l_w/2;

module __tunnel_interface()
{
    _x = get_tunnel_interface_offset();
    _y = mxx_ti_d;
    _z = get_tunnel_interface_connection_outer_h();
    _size = [_x, _y, _z];
    mxx_tunnel_interface_outer()
        cubepp(_size,align="xZ");
}

module __tunnel_build_area()
{

}


module tunnel(n_cols, n_rows=1)
{

    __tunnel_interface();


}

// testing
tunnel(3);