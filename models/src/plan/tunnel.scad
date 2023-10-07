// include solidpp
include <../../libs/solidpp/solidpp.scad>

// include constants
include <../metroxx-constants.scad>

// interfaces
use <tunnel-interface.scad>
use <building-interface.scad>

// tunnel interface offset
function get_tunnel_interface_offset() = mxx_ti_l_off + mxx_l_w/2;

// interface to the link
module __tunnel_interface()
{
    _x = get_tunnel_interface_offset() + mxx_b_cr+mxx_bw;
    _y = mxx_ti_d;
    _z = get_tunnel_interface_connection_outer_h();
    _size = [_x, _y, _z];
    mxx_tunnel_interface_outer()
        cubepp(_size, align="xz");
}

// area that can be build upon
module __tunnel_build_area(n_cols, n_rows)
{
    _x = n_cols*(mxx_b_a+mxx_bw) + mxx_bw;
    _y = n_rows*(mxx_b_a+mxx_bw) + mxx_bw;
    _z = mxx_ti_h;
    _size = [_x, _y, _z];
    _mod_list = [round_edges(r=mxx_b_cr+mxx_bw)];

    difference()
    {
        cubepp(_size, align="xz", mod_list=_mod_list);

    }
}

// tunnel module
module tunnel(n_cols, n_rows=1)
{
    difference()
    {
        _t = [get_tunnel_interface_offset(),0,0];
        union()
        {
            __tunnel_interface();
            translate(_t)
                __tunnel_build_area(n_cols=n_cols, n_rows=n_rows);
        }

        // holes
        translate(_t)
        for(xi=[0:n_cols-1])
        {
            for(yi=[0:n_rows-1])
            {
                _xo = mxx_b_a/2+mxx_bw + xi*(mxx_bw+mxx_b_a);
                _yo = (n_rows*(mxx_b_a+mxx_bw) + mxx_bw)/2 - mxx_b_a/2 - mxx_bw - yi*(mxx_b_a+mxx_bw);
                _zo = mxx_hu;
                _off = [_xo, _yo, _zo];
                translate(_off)
                    mxx_building_hole();                    
            }
        }
    }

}

// testing
tunnel(3);