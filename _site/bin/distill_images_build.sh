#!/bin/bash

# kill the existing container
sudo podman stop docs-internal
sudo podman rm docs-internal

# remove the existing image
sudo podman rmi sykdomspulsen:documentation-internal

# this should remove the tag from the existing image and assign it to the new one here
sudo podman build \
  --tag=sykdomspulsen:documentation-internal \
  $WORKSPACE
sudo chmod -R 777 $WORKSPACE