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

On gaea use the environment:
```
. scripts/gaea-intel-env
```

To compile, use
```
make -s -j
```

To compile in orion, use `Makefile` with
```
make TEMPLATE=src/mkmf/templates/orion-intel.mk
```

To compile in gaea, use `Makefile` with
```
make TEMPLATE=src/mkmf/templates/ncrc-intel.mk
```

To run a test case use the `submit` script on orion:
```
cd config_0p25
sbatch submit
```
Use `submit_cheyenne` on cheyenne and `submit_gaea.csh` on gaea.

To start over, delete the directory `build` before continuing with the steps.
