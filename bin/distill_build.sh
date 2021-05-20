#!/bin/bash

echo Running $1 in testbash
echo " "
sudo podman run --rm \
  -v $WORKSPACE:/git/sykdomspulsen-dokumentasjon \
  sykdomspulsen:bash Rscript -e 'rmarkdown::render_site("/git/sykdomspulsen-dokumentasjon")'

#sudo mv -r $WORKSPACE/sykdomspulsen/docs/reference $WORKSPACE/_site/
sudo chmod -R 777 $WORKSPACE