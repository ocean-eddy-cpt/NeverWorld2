NeverWorld2
===========

Make a fork on github of:
https://github.com/ocean-eddy-cpt/NeverWorld2

To clone: 
```
git clone --recursive https://github.com/neerajabhamidipati/NeverWorld2.git

```

On cheyenne use the environment:
```
. scripts/cheyenne-intel-env
```

On orion use the environment:
```
. scripts/orion-intel-env
```

To compile in orion, use `Makefile` with
```
make TEMPLATE=src/mkmf/templates/orion-intel.mk
```

To run a test case use the `submit` script:
```
cd config_0p25
sbatch submit
```

To start over, delete the directory `build` before continuing with the steps.
