#!/bin/bash

echo Running $1 in testbash
echo " "
sudo podman run --rm \
  -v $JENKINS_WORKSPACE:/git \
  sykdomspulsen:bash Rscript -e 'rmarkdown::render_site("/git/documentation")'