#!/bin/bash

echo Running $1 in testbash
echo " "
sudo podman run --privileged --rm \
  -v $WORKSPACE:/git/sykdomspulsen-dokumentasjon \
  dsyk:bash_interactive Rscript -e 'rmarkdown::render_site("/git/sykdomspulsen-dokumentasjon")'

#sudo mv -r $WORKSPACE/sykdomspulsen/docs/reference $WORKSPACE/_site/
sudo chmod -R 777 $WORKSPACE

sudo podman run --privileged --rm \
  -v $WORKSPACE:/git/sykdomspulsen-dokumentasjon \
  dsyk:bash_interactive /usr/local/bin/deploy_sykdomspulsen_dokumentasjon.sh