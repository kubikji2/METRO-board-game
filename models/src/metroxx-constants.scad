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

// number of tunnels
mxx_n_tunnels = 3;

/////////////
// tunnels //
/////////////

// tunnels interface height
mxx_ti_h = mxx_hu;
// tunnels interface diameter
mxx_ti_d = mxx_a;



// tunnel paramteres

// tunnel interface parameters

// building parameters

// build interface parameters

// station name paramters

