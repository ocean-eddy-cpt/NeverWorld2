We solve the vector-invariant form of the stacked shallow water equations in a domain with 15 layers and 16 interfaces. 

![alt text](https://github.com/neerajabhamidipati/NeverWorld2/blob/master/docs/summary.png)


## Topography

See `topo_builder.py` and `NeverWorld2.ipynb`. The final configuration (panel (c) in `NeverWorld2.ipynb`) does not include the New England coast. The domain extends from 0 to 60E in the zonal direction and -70S to 70 N in the meridional direction.

## Layer density and thickness

See `Stratification.ipynb`. The total depth of the ocean is 4000 metres. The reference density is `RHO_0 = 1000.0 [kg m-3]` with `BOUSSINESQ = True` and `G_EARTH = 10.0 [m s-2]`.

## Resolution

We currently have runs at four different resolutions (1/4 degree, 1/8 degree, 1/16 degree, 1/32 degree). In the 1/4 degree run, the number of grid points in zonal and meridional directions are `NIGLOBAL = 240` and `NJGLOBAL=560`; these values double in the 1/8 degree run. 

## Grid 

We use a simple spherical grid with `RAD_EARTH = 6.378E+06 [m]`.

## Numerical scheme

`ARAKAWA_HSU90` (Arakawa & Hsu, 1990) is the preferred option. The other option is to use `SADOURNY75_ENERGY` which is the default in MOM6.

## Surface wind profile

See notebook `Wind_profile.ipynb`. However, the final configuration uses slightly weaker trade winds with `taud = [0,0.2,-0.05,-0.01,-0.05,0.1,0]` at latitudes in `Wind_profile.ipynb`. With `DIRECT_STRESS = True`, the wind stress is applied over a depth of `MIX_STRESS = 5.0 [m]`.

## Rotation of the earth

`ROTATION = "2omegasinlat"`: use twice the planetary roation rate with `OMEGA = 7.2921E-05 [s-1]`.

## Horizontal viscosity

```
SMAGORINSKY_AH = True    ! biharmonic Smagorinsky nonlinear eddy viscosity
SMAG_BI_CONST = 0.2 [nd] ! nondimensional biharmonic Smagorinsky constant, typically 0.015 - 0.06

```

## Vertical mixing scheme

Vertical viscosity is given by `KV=1.0E-04 [m2 s-1]`, which is the background kinematic viscosity in the interior. Otherwise it is fully adiabatic.

## Bottom drag

```
BOTTOMDRAGLAW = True ! If true, the bottom stress is calculated with a drag law of the form c_drag*|u|*u 
CDRAG = 0.003 [nd] ! drag coefficient relating the magnitude of the velocity field to the bottom stress. 
```










