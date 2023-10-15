# [ARCHIVE] Game-pieces hiearchy

Directory hiearchy:

- `mxx_constants.scad`
  - contains all constants used across the model resources
  - use prefix *mxx* to define constants used across the resources
- **Symbols** - single library file containing all symbols with customizable thickness and size
  - METRO-specific (spanner variants, medical crosses, etc.), Q++ interfaced (radiation, biohazard, etc.) and graphics-based (pigs, chickens, shrooms, ammo, etc.)
- **Graphics**
  - contain directories with `.stl` or other binary files
    - each directory contains license/origin if known
  - single library file used as interface
- **Resources**
  - use Q++, symbols and graphics
  - unified size for the resourcess
  - single library file
- **Plan**  
  - single main file, multiple library files containing the particular game pieces
    - for examle: `buildings`, `links`, `danger`, `stations`, `station-names`, `back-rooms`
  - contain folder for generating the station tags for different langauges
    - consult the russian names with Natasha (Dave's wife)
  - two game-piece variants, one for the (single-nozzle) multi-material and one for mid-layer filament swap

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
- [ ] resources graphics
  - [ ] back-up pig
  - [ ] back-up hens
  - [ ] add 7.62x39 ammo
- [x] buildings - `mxx_buildings.scad`
  - [x] back-up building base
  - [x] back-up those few buildings
- [x] plan
  - [x] redo links
    - [x] todo make consequentive holes closer together
  - [x] redo the danger triangles
    - [x] include symbols from the `symbols.scad`
  - [x] redo stations
    - [x] unify the dimensions
    - [x] redo station names
  - [x] redo (service) tunnels

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
  - [ ] model stations caps for ideologies
  - [ ] model interchange station variants
- [ ] symbols
  - [ ] include symbols of the resources
