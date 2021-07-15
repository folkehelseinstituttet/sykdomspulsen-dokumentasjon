#!/bin/bash

echo Running $1 in testbash
echo " "
sudo podman run --privileged --rm \
  -v $WORKSPACE:/git/sykdomspulsen-dokumentasjon \
  dsyk:bash_interactive Rscript -e 'rmarkdown::render_site("/git/sykdomspulsen-dokumentasjon", envir = new.env())'

#sudo mv -r $WORKSPACE/sykdomspulsen/docs/reference $WORKSPACE/_site/
sudo chmod -R 777 $WORKSPACE

