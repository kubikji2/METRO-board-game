// TODO add constants

mxx_fn = 120;
mxx_eps = 0.01;
mxx_2eps = 2*mxx_eps;
mxx_xy_tol = 0.125;
mxx_z_tol = 0.25;

// buildings constants
// '-> TODO: possibly duplicate
mxx_b_r = 2.5;
mxx_b_a = 10;
mxx_b_depth = 1.5;
// building symbol radius
mxx_b_sr = 8;

// symbols
mxx_s_r = 5;
mxx_s_h = 1;

// links
// '-> height unit
mxx_l_hu = 2;
// '-> link border
mxx_l_border = 2;
// '-> link width = 2 borders and building width
mxx_l_w = 2*mxx_l_border + mxx_b_a;
// '-> link building hole/height
mxx_l_bh = mxx_b_depth;