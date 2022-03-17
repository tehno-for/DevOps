#!/usr/bin/env make
.PHONY: run_website stop_website install_kind

run_website:
	docker build -t explorecalifornia.com . && \
		docker run -p 5000:80 -d --name explorecalifornia.com --rm explorecalifornia.com
stop_website:
	docker stop explorecalifornia.com

install_kind: 
	curl --location --output ~/opt/kind https://github.com/kubernetes-sigs/kind/releases/download/v0.12.0/kind-linux-amd64
		alias kind = "/home/rustam/opt/kind"
			kind --version