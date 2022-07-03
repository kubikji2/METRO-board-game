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
