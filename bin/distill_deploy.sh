#!/bin/bash

sudo podman run --privileged --rm \
  -v $WORKSPACE:/git/sykdomspulsen-dokumentasjon \
  dsyk:bash_interactive /usr/local/bin/deploy_sykdomspulsen_dokumentasjon.sh