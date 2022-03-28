NeverWorld2
===========

This repository contains the NeverWorld2 (NW2) configurations for the baseline experiments described in Marques et al., (2022) [TODO: add a link to the masnuscript]. 


Make a fork on github of:
https://github.com/ocean-eddy-cpt/NeverWorld2

To clone:
```
git clone --recursive https://github.com/ocean-eddy-cpt/NeverWorld2.git

```

On cheyenne use the environment:
```
. scripts/cheyenne-intel-env
```

On orion use the environment:
```
. scripts/orion-intel-env
```

On gaea use the environment:
```
. scripts/gaea-intel-env
```

To compile, use
```
make -s -j
```

or (in Cheyenne)

```
. scripts/make_FMS
. scripts/make_repro
```

To compile in orion, use `Makefile` with
```
make TEMPLATE=src/mkmf/templates/orion-intel.mk
```

To compile in gaea, use `Makefile` with
```
make TEMPLATE=src/mkmf/templates/ncrc-intel.mk
```

To run a test case in Cheyenne:
```
cd simulations/baselines/nw2_0.25deg_N15_baseline_hmix20/
qsub submit_cheyenne
```
Use `submit_gaea.csh` on gaea.

To start over, delete the directory `build` before continuing with the steps.
