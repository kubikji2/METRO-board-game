use<link.scad>
use<tunnel.scad>
use<link-joints.scad>
use<station-buildings-holder.scad>
use<station-label-holder.scad>
use<station-label.scad>
use<danger-triangles.scad>

// model selection
model = "link"; //["link", "tunnel", "danger-triangle", "station", "interchange", "station-name-holder", "station-buildings-holder", "building"]

// number of colomns if applicable
n_cols = 3; //[1:1:5]

// number of rows if applicable
n_rows = 1; //[1:1:2]

// types of danger triangle if applicable
danger_triangle_type = "uknown"; //["uknown", "general", "radiation", "psychological", "biohazard", "combined"]

// define whether is other than base color
is_other_color = false;

// types of building if applicable
// TODO

// station name if applicable
// TODO


$fn = $preview ? 30 : 120;

if (model == "link")
{
    link();
    echo(str(model,".stl"));
}
else if (model=="tunnel")
{
    tunnel(n_cols, n_rows);    
    echo(str(model, "-", n_cols, "-", n_rows, ".stl"));
}
else if (model=="danger-triangle")
{
    if (is_other_color)
    {
        danger_triangle_symbol(danger_symbol);
    }
    else
    {
        danger_triangle(danger_triangle_type);    
    }

    echo(str(model, "-", danger_triangle_type, is_other_color ? "-symbol" : "s", ".stl"));
}
else if (model=="station")
{
    regular_station_joint();
    echo(str(model,".stl"));
}
else if (model=="interchange")
{
    interchange_station_joint();
    echo(str(model, ".stl"));
}
else if (model=="station-name-holder")
{
    station_label_holder();
    echo(str(model, ".stl"));
}
else if (model=="station-name")
{
    station_label();
    echo(str(model,".stl"));
}
else if (model=="station-buildings-holder")
{
    station_buildings_holder(n_cols, n_rows);
    echo(str(model, "-", n_cols, "-", n_rows, ".stl"));
}
else if (model=="building")
{
    echo("BUILDING IS NOT IMPLEMENTED YET!");    
}
