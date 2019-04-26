# Bitwarden Openshift setup

To use this template, you first need to build and push the custom docker
containers by running

``` bash
export REGISTRY=openshift-registry.internal.catalysts.cc
export PROJECT=$(oc project -q)
docker login -u $USER -p $(oc whoami -t) $REGISTRY
make docker
```

After that, create the template by running

``` bash
oc create -f bitwarden-template.yaml
```

