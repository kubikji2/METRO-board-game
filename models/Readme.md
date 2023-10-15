# 3D models

This directory contain 3D models necessary for the game.
The script-only based modeller [OpenScad](https://openscad.org/index.html) is used to design game elemenents and extended by [Q++ OpenSCAD Lirary](https://github.com/kubikji2/qpp-openscad-library) as git-submodules.
The `stl` format is used for resulting models since it is both natively [support by github](https://www.youtube.com/watch?v=JV0NX_-Pr5Y) and common in 3D printing comunity.

## Directory structure

- `libs` contain all submodules (Q++ etc.) and project-specific library `.scad`-files
- `src` contain all OpenSCAD source files
- `export` contain all exported `.stl`-files ready to be printed

## How to manage git-submodules

After cloning this repository, run:

```shell
git submodule init 
```

and

```shell
git submodule update 
```

to init local packages and update them.

To get the most recent version of the qit-submodules, run:

```shell
git submodule update --remote
```

assuming that `.gitmodules` has defined branch for the submodule.

For more information see [git manual](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

## Basic idea about modeling source files structure

- use libraries for geometries -- mainly use Q++
- create additional library containing the board-game specific elements such as additional symbols or geometries
  - geometries that can be used outside of this board-game should be implemented in Q++
- create a single file containing all of the constants defining the game-board dimensions
- include constants-file and libraries in files modeling the game elements

## ROADMAPs

- [x] Add submodule update scripts
- [ ] Define directory structure and constants file
- [ ] Update to Solidpp
  - [x] Add submodule
  - [ ] Remove Q++ dependency
- [ ] Update directory structure
  - [ ] Create directory structure and constants file
  - [ ] Sort the filess
- [x] Update links
  - [x] Make all links with 3 tunel-slots for each station
  - [x] Enable connecting all 3 tunel-slots at the same time
- [ ] Update station
  - [ ] Create own model for station name
  - [ ] Create station building slots
  - [ ] Create joint for the station name ans station building slots and possible danger
- [ ] Update tunels
  - [ ] Make a selection of tunnels
- [ ] Update dangers
  - [ ] Make dangers single/multicolor options
- [ ] Update buildings and building-like fills
  - [ ] Make a selection of buildings