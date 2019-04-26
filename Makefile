##
# Bitwarden Openshift Template
#
# @file
# @version 0.1

CUSTOM_IMAGES := $(wildcard custom/*/)
.PHONY: all build clean check_clean docker $(CUSTOM_IMAGES)

check_clean:
	@echo -n "Are you sure? " && read ans && [ $$ans == y ]

clean: check_clean
	@oc delete all -l app=bitwarden-template

docker: $(CUSTOM_IMAGES)

$(CUSTOM_IMAGES):
	@echo "Building $@"
	cd $@ && docker build --build-arg CORE_VERSION --build-arg WEB_VERSION -t  $(REGISTRY)/$(PROJECT)/bitwarden-$(shell basename $@) .
	@echo "Pushing $@"
	docker push $(REGISTRY)/$(PROJECT)/bitwarden-$(shell basename $@)
	@echo ""


# end
