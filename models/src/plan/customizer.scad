use<link.scad>
use<tunnel.scad>
use<link-joints.scad>
use<station-buildings-holder.scad>
use<station-label-holder.scad>
use<station-label.scad>

// model selection
model = "link"; //["link", "tunnel", "danger-triangle", "station", "interchange", "station-name-holder", "station-buildings-holder", "building"]

// number of colomns if applicable
n_cols = 3; //[1:1:5]

// number of rows if applicable
n_rows = 1; //[1:1:2]

// types of danger triangle if applicable
// TODO

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
    echo(str(model,"-", n_cols, "-", n_rows,".stl"));
}
else if (model=="danger-triangle")
{
    echo("DANGER TRIANGLE IS NOT IMPLEMENTED YET!");
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
