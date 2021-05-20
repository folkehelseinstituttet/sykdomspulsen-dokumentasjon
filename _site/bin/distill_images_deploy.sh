#!/bin/bash

sudo podman save -o ~/spuls_docs-internal.tar sykdomspulsen:documentation-internal

# internal images
scp ~/spuls_docs-internal.tar spulsapp@posl-fhi-syk01:/images

# stop container
ssh spulsapp@posl-fhi-syk01 'sudo podman stop docs-internal && sudo podman rm docs-internal'

# copy and load images
ssh spulsapp@posl-fhi-syk01 'sudo podman load -i /images/spuls_docs-internal.tar; rm /images/spuls_docs-internal.tar'
ssh spulsapp@posl-fhi-syk01 'sudo podman image prune -f'

sudo rm ~/spuls_docs-internal.tar 

# update internal prod
ssh spulsapp@posl-fhi-syk01 'sudo podman run -d --name docs-internal -p 127.0.0.1:20020:20020 localhost/sykdomspulsen:documentation-internal'
