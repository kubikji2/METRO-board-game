// This file contains all necessary constants for the 3D models

////////////////////////////////////
// 3D-printing related parameters //
////////////////////////////////////

// resolution
$fn = $preview ? 30 : 120;
// eps for preview
mxx_eps = $preview ? 0.01 : 0;
// 2xeps for preview
mxx_2eps = 2*mxx_eps;
// xy-plane clearance
mxx_xy_clrn = 0.125;
// z-axis clearance
mxx_z_clrn = 0.25;

//////////////////////////////////
// Metro20XX general parameters //
//////////////////////////////////

// height unit - basic unit of a singe layer in z-axit
mxx_hu = 2;
// border width - basic border width
mxx_bw = 2;
// default building and inteface side
mxx_a = 10;

///////////
// links //
///////////

// link interface height
mxx_li_h = 10*mxx_hu;
// link interface diameter
mxx_li_d = mxx_a;

// link width
mxx_l_w = mxx_a + 2*mxx_bw;
// link height
mxx_l_h = 2*mxx_hu;

// middle section length
mxx_l_ml = 50;

// number of tunnels
mxx_n_tunnels = 3;

/////////////
// tunnels //
/////////////

// tunnels interface height
mxx_ti_h = mxx_hu;
// tunnels interface diameter
mxx_ti_d = mxx_a;


/////////////////////
// danger triangle //
/////////////////////

// danger triangle interface height
mxx_dti_h = mxx_hu;

// danger triangle interface diameter
mxx_dti_d = mxx_a;


///////////////
// buildings //
///////////////

// building side
mxx_b_a = mxx_a;
// building corner radius
mxx_b_cr = 2;
// building height
mxx_b_h = 2*mxx_hu;
// building offset
mxx_b_h_off = 0.5*mxx_hu;

// building parameters

// build interface parameters

// station name paramters

