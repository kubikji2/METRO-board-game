include <../mxx_constants.scad>
include <../qpp_lib.scad>
include <buildings.scad>

module service_tunnel(length=3,width=2)
{

    _a = mxx_l_w-mxx_xy_tol;
    _t = mxx_l_hu-mxx_z_tol;
    _r = mxx_t_r;

    // tunnel connector, i.e. ring
    qpp_ring(h=_t,r=_r, D=_a, $fn=mxx_fn);

    // tunnel link
    difference()
    {
        _x_off = _r;
        translate([-_a/4 + _x_off,-_r,0])
            cube([mxx_t_cl,2*_r,_t]);
        
        translate([0,0,-mxx_eps])
            cylinder(r=_r, h=_t+mxx_2eps, $fn=mxx_fn);       
    }

    // building plareau
    translate([mxx_t_cl,-_a/2,0])
        __building_plateau(cols=length,rows=width);
}