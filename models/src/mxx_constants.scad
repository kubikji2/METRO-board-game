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

// tunel parameters
mxx_t_r = mxx_b_a/2;

// dange triangle blok
// '-> length
mxx_dt_l = 25;
// '-> triangle connector hole radius
mxx_dt_cr = mxx_b_a/2;
// '-> triangle hole depth
mxx_dt_cdepth = mxx_b_depth;
// '-> triangle symbol radius
mxx_dt_sr = mxx_b_a;
// '-> trangle symbol thickness
mxx_dt_st = 1;
// '-> triangle rounding radius
mxx_dt_rr = mxx_b_r;
// '-> triangle thickness
mxx_dt_t = mxx_l_hu;
// '-> triangle connector height
mxx_dt_ch = 2*mxx_dt_cdepth - 2*mxx_z_tol;

// danger names
MXX_DT_BIOHAZARD = "biohazard";
MXX_DT_RADIATION = "radiation";
MXX_DT_ANOMALY   = "anomaly";
MXX_DT_OTHER     = "other";
MXX_DT_UKNOWN    = "uknown";
MXX_DT_DANGER    = "danger";

// station parameters
// connector radius
mxx_s_cr = 4;
// connector height
mxx_s_ch = 5*mxx_l_hu;
// station name len
mxx_s_nl = 5*mxx_b_a+6*mxx_l_border;
// station name thickness
mxx_s_nt = 1;