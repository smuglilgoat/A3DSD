#!/bin/bash

#https://github.com/simonfuhrmann/mve
#git clone https://github.com/simonfuhrmann/mve.git

#photos dans images/
#binaires de mve dans bin/
#sortie dans le rép. scene/

scene="scene"
bin/makescene -i images $scene
bin/sfmrecon $scene
bin/dmrecon -s2 $scene
bin/scene2pset -F2 $scene $scene/pset-L2.ply
bin/fssrecon $scene/pset-L2.ply $scene/surface-L2.ply
bin/meshclean -t10 $scene/surface-L2.ply $scene/surface-L2-clean.ply
