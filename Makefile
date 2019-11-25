

# Serve on port 8080
serve:
	docker run -it -p 8080:8080 -v $(CURDIR):/opt/app -w /opt/app node yarn serve

# Builds under dist folder
build:
	docker run --rm -it -v $(CURDIR):/opt/app -w /opt/app node yarn build

# Production 
deploy:
	docker run -d -p 8080:80 -v $(CURDIR)/dist:/usr/share/nginx/html nginx 