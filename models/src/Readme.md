# Game-pieces hiearchy

Directory hiearchy:

- **Buildings**
  - main file containg the base building shape
    - include constants from the plan
    - use symbols to create the building
    - two game-piece variants, one for the (single-nozzle) multi-material and one for mid-layer filament swap
- **Symbols**
  - single library file containing all symbols in unified thickness and size
  - multiple files containg specific symbols, such as spanners, chicken, ammo, etc.
- **Graphics**
  - contain directories with `.stl` or other binary files
    - each directory contains license/origin if known
- **Plan**
  - single constants master-file defining the dimensions of the plan
    - use prefix *mxx* to define constants used across the resources
  - define the library files containing the particular game pieces
    - for examle: `links`, `danger`, `stations`, `station-names`, `back-rooms`
  - contain folder for generating the station tags for different langauges
    - consult the russian names with Natasha (Dave's wife)
  - single main file
- **Resources**
  - single interface/library
  - use Q++ and symbols
  - unified size for the resources

## Roadmap

### back-up stage

- [ ] `mxx_constants.scad`
  - contain all important constants in one file
  - [x] create file
  - [ ] add constant from the previous srcs
- [x] symbols
  - [x] create wrappers for the existing symbols in `qpp_symbols`
  - [x] move the symbols from links to the symbols
  - [x] move spanner from buildings
  - [x] unify the size to some reasonable value
    - this size has multilier for particular applications (building, danger-triangle, etc.)
- [ ] graphics
  - [ ] back-up pig
  - [ ] back-up hens
  - [ ] add 7.62x39 ammo
- [x] buildings - `mxx_buildings.scad`
  - [x] back-up building base
  - [x] back-up those few buildings
- [ ] plan
  - [x] redo links
    - [x] todo make consequentive holes closer together
  - [x] redo the danger triangles
    - [x] include symbols from the `symbols.scad`
  - [x] redo stations
    - [x] unify the dimensions
    - [x] redo station names
  - [ ] redo (service) tunnels

### new tasks

- TODO

- [ ] plan-links
  - [ ] consider adding double joint in place of the tunnel danger
  - [ ] model the surface endings
  - [ ] model the destroyed ending
- [ ] plan - danger triangles
  - [ ] create multicolor variant of triangles
- [ ] plan - stations
  - [ ] make station names multimaterial
  - [ ] make stations caps for ideologies

