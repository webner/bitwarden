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
oc create -f bitwarden.yaml
```

To use the template, you can run:

``` bash
oc process bitwarden -p APP_NAME="subdomain" -p INST_ID="" -p INST_KEY="" -p DOMAIN="example.org" |oc create -f -
```
Where `APP_NAME` is a subdomain, `DOMAIN` is the domain, and INST_ID and INST_KEY are taken from [the Bitwarden host page](https://bitwarden.com/host/)
