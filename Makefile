
SHELL = /bin/sh

CURRENT_UID := $(shell id -u)
CURRENT_GID := $(shell id -g)

export CURRENT_UID
export CURRENT_GID

# Serve on port 8080
serve:
	docker run --rm -it -p 8080:8080 -u ${CURRENT_UID}:${CURRENT_GID} -v $(CURDIR):/opt/app -w /opt/app node bash -c 'yarn && yarn serve'

# Builds under dist folder
build:
	docker run --rm -it -u ${CURRENT_UID}:${CURRENT_GID} -v $(CURDIR):/opt/app -w /opt/app node yarn build

# Production 
deploy:
	docker run --name vuedashboard -d -p 8080:80 -u ${CURRENT_UID}:${CURRENT_GID} -v $(CURDIR)/dist:/usr/share/nginx/html nginx 

undeploy:
	docker stop vuedashboard
	docker rm vuedashboard