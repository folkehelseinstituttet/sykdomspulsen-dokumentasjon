#!/bin/bash


PATH_CONTROL=$SYKDOMSPULSEN_GIT/documentation

if [[ "$WORKSPACE" != "" ]]; then
  PATH_CONTROL=$WORKSPACE
  # source $WORKSPACE/bin/setup_tests.sh
fi

export PATH_CONTROL=$PATH_CONTROL
#source $PATH_CONTROL/bin/spuls-public.sh

echo "PATH_CONTROL*************************"
echo $PATH_CONTROL

sudo podman build \
  --tag=sykdomspulsen:documentation-internal \
  $PATH_CONTROL

sudo podman image prune -f