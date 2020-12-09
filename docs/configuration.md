We solve the vector-invariant form of the stacked shallow water equations in a domain with 15 layers and 16 interfaces. 

![alt text](https://github.com/neerajabhamidipati/NeverWorld2/blob/master/docs/summary.png)


## Topography

See `topo_builder.py` and `NeverWorld2.ipynb`. The final configuration (panel (c) in `NeverWorld2.ipynb`) does not include the New England coast. The domain is periodic in the zonal direction:

```
REENTRANT_X = True              !   [Boolean] default = True
                                ! If true, the domain is zonally reentrant.
REENTRANT_Y = False             !   [Boolean] default = False
                                ! If true, the domain is meridionally reentrant.
TRIPOLAR_N = False              !   [Boolean] default = False
                                ! Use tripolar connectivity at the northern edge of the domain.  With
                                ! TRIPOLAR_N, NIGLOBAL must be even.
```

## Grid 

We use a simple spherical grid. The domain extends from 0 to 60E in the zonal direction and -70S to 70 N in the meridional direction.

```
GRID_CONFIG = "spherical"       !
                                ! A character string that determines the method for defining the horizontal
                                ! grid.  Current options are:
                                !     mosaic - read the grid from a mosaic (supergrid)
                                !              file set by GRID_FILE.
                                !     cartesian - use a (flat) Cartesian grid.
                                !     spherical - use a simple spherical grid.
                                !     mercator - use a Mercator spherical grid.
SOUTHLAT = -70.0                !   [degrees]
                                ! The southern latitude of the domain.
LENLAT = 140.0                  !   [degrees]
                                ! The latitudinal length of the domain.
WESTLON = 0.0                   !   [degrees] default = 0.0
                                ! The western longitude of the domain.
LENLON = 60.0                   !   [degrees]
                                ! The longitudinal length of the domain.
RAD_EARTH = 6.378E+06           !   [m] default = 6.378E+06
```

## Layer density and thickness

See `Stratification.ipynb`. The total depth of the ocean is 4000 metres. 

```
G_EARTH = 10.0                  !   [m s-2] default = 9.8
                                ! The gravitational acceleration of the Earth.
RHO_0 = 1000.0                  !   [kg m-3] default = 1035.0
                                ! The mean ocean density used with BOUSSINESQ true to calculate accelerations
                                ! and the mass for conservation properties, or with BOUSSINSEQ false to convert
                                ! some parameters from vertical units of m to kg m-2.
BOUSSINESQ = True               !   [Boolean] default = True
                                ! If true, make the Boussinesq approximation.
ANGSTROM = 1.0E-10              !   [m] default = 1.0E-10
                                ! The minimum layer thickness, usually one-Angstrom.
H_TO_M = 1.0                    !   [m H-1] default = 1.0
                                ! A constant that translates the model's internal units of thickness into m.
NK = 15                         !   [nondim]
                                ! The number of model layers.
INIT_THICKNESS_PROFILE = 25.0, 50.0, 100.0, 125.0, 150.0, 175.0, 200.0, 225.0, 250.0, 300.0, 350.0, 400.0, 500.0, 550.0, 600.0 !   [m]
                                ! Profile of initial layer thicknesses.
```

## Resolution

We currently have runs at four different resolutions (1/4 degree, 1/8 degree, 1/16 degree, 1/32 degree). In the 1/4 degree run:

```
NIGLOBAL = 240                  !
                                ! The total number of thickness grid points in the x-direction in the physical
                                ! domain. With STATIC_MEMORY_ this is set in MOM_memory.h at compile time.
NJGLOBAL = 560                  !
                                ! The total number of thickness grid points in the y-direction in the physical
                                ! domain. With STATIC_MEMORY_ this is set in MOM_memory.h at compile time.
NIHALO = 4                      ! default = 4
                                ! The number of halo points on each side in the x-direction.  How this is set
                                ! varies with the calling component and static or dynamic memory configuration.
NJHALO = 4                      ! default = 4
                                ! The number of halo points on each side in the y-direction.  How this is set
                                ! varies with the calling component and static or dynamic memory configuration.
```

In the higher resolution runs, the only parameters that change are `NIGLOBAL` and `NJGLOBAL`, which double for each successive higher resolution run.


## Numerical scheme

`ARAKAWA_HSU90` (Arakawa & Hsu, 1990) is the preferred option. The other option is to use `SADOURNY75_ENERGY` which is the default in MOM6.

```
CONTINUITY_SCHEME = "PPM"       ! default = "PPM"
                                ! CONTINUITY_SCHEME selects the discretization for the continuity solver. The
                                ! only valid value currently is:
                                !    PPM - use a positive-definite (or monotonic)
                                !          piecewise parabolic reconstruction solver.
CORIOLIS_EN_DIS = True          !   [Boolean] default = False
                                ! If true, two estimates of the thickness fluxes are used to estimate the
                                ! Coriolis term, and the one that dissipates energy relative to the other one is
                                ! used.
CORIOLIS_SCHEME = "ARAKAWA_HSU90" ! default = "SADOURNY75_ENERGY"
                                ! CORIOLIS_SCHEME selects the discretization for the Coriolis terms. Valid
                                ! values are:
                                !    SADOURNY75_ENERGY - Sadourny, 1975; energy cons.
                                !    ARAKAWA_HSU90     - Arakawa & Hsu, 1990
                                !    SADOURNY75_ENSTRO - Sadourny, 1975; enstrophy cons.
                                !    ARAKAWA_LAMB81    - Arakawa & Lamb, 1981; En. + Enst.
                                !    ARAKAWA_LAMB_BLEND - A blend of Arakawa & Lamb with
                                !                         Arakawa & Hsu and Sadourny energy
BOUND_CORIOLIS = True           !   [Boolean] default = False
                                ! If true, the Coriolis terms at u-points are bounded by the four estimates of
                                ! (f+rv)v from the four neighboring v-points, and similarly at v-points.  This
                                ! option would have no effect on the SADOURNY Coriolis scheme if it were
                                ! possible to use centered difference thickness fluxes.
KE_SCHEME = "KE_ARAKAWA"        ! default = "KE_ARAKAWA"
                                ! KE_SCHEME selects the discretization for acceleration due to the kinetic
                                ! energy gradient. Valid values are:
                                !    KE_ARAKAWA, KE_SIMPLE_GUDONOV, KE_GUDONOV
PV_ADV_SCHEME = "PV_ADV_CENTERED" ! default = "PV_ADV_CENTERED"
                                ! PV_ADV_SCHEME selects the discretization for PV advection. Valid values are:
                                !    PV_ADV_CENTERED - centered (aka Sadourny, 75)
                                !    PV_ADV_UPWIND1  - upwind, first order
```

## Boundary conditions

```
NOSLIP = False                  !   [Boolean] default = False
                                ! If true, no slip boundary conditions are used; otherwise free slip boundary
                                ! conditions are assumed. The implementation of the free slip BCs on a C-grid is
                                ! much cleaner than the no slip BCs. The use of free slip BCs is strongly
                                ! encouraged, and no slip BCs are not used with the biharmonic viscosity.
```

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

`ADIABATIC = True !  There are no diapycnal mass fluxes if ADIABATIC is true.`

## Bottom drag

```
BOTTOMDRAGLAW = True            !   [Boolean] default = True
                                ! If true, the bottom stress is calculated with a drag law of the form
                                ! c_drag*|u|*u. The velocity magnitude may be an assumed value or it may be
                                ! based on the actual velocity in the bottommost HBBL, depending on LINEAR_DRAG.
LINEAR_DRAG = False             !   [Boolean] default = False
                                ! If LINEAR_DRAG and BOTTOMDRAGLAW are defined the drag law is
                                ! cdrag*DRAG_BG_VEL*u.
CDRAG = 0.003                   !   [nondim] default = 0.003
                                ! CDRAG is the drag coefficient relating the magnitude of the velocity field to
                                ! the bottom stress. CDRAG is only used if BOTTOMDRAGLAW is defined.
DRAG_BG_VEL = 0.01              !   [m s-1] default = 0.0
                                ! DRAG_BG_VEL is either the assumed bottom velocity (with LINEAR_DRAG) or an
                                ! unresolved  velocity that is combined with the resolved velocity to estimate
                                ! the velocity magnitude.  DRAG_BG_VEL is only used when BOTTOMDRAGLAW is
                                ! defined.
BBL_USE_EOS = False             !   [Boolean] default = False
                                ! If true, use the equation of state in determining the properties of the bottom
                                ! boundary layer.  Otherwise use the layer target potential densities.
BBL_THICK_MIN = 0.1             !   [m] default = 0.0
                                ! The minimum bottom boundary layer thickness that can be used with
                                ! BOTTOMDRAGLAW. This might be Kv/(cdrag*drag_bg_vel) to give Kv as the minimum
                                ! near-bottom viscosity.
HTBL_SHELF_MIN = 0.1            !   [m] default = 0.1
                                ! The minimum top boundary layer thickness that can be used with BOTTOMDRAGLAW.
                                ! This might be Kv/(cdrag*drag_bg_vel) to give Kv as the minimum near-top
                                ! viscosity.
```










