We solve the vector-invariant form of the stacked shallow water equations in a domain with 15 layers and 16 interfaces. 

![alt text]


## Topography

See `topo_builder.py` and `NeverWorld2.ipynb`. The final configuration (panel (c) in `NeverWorld2.ipynb`) does not include the New England coast.

## Resolution

We currently have runs at four different resolutions (1/4 degree, 1/8 degree, 1/16 degree, 1/32 degree). 

## Surface wind profile

See notebook `Wind_profile.ipynb`. However, the final configuration uses slightly weaker trade winds with `taud = [0,0.2,-0.05,-0.01,-0.05,0.1,0]` in `Wind_profile.ipynb`.


