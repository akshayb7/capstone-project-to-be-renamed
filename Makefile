#!/bin/bash
## The Makefile includes instructions on environment setup and lint tests

setup:
	# Create virtualenv
	python3 -m venv venv
	# Activate virtualenv
	source venv/bin/activate

activate:
	# Activate virtualenv
	source venv/bin/activate

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt

modelsetup:
	# mkdir -p app/models
	python3 app/model_downloader.py

dockerbuild:
	sudo docker build -t sentiment -f Dockerfile .
	
dockerrun:
	sudo docker run -p 8080:8080 sentiment

lint:
	pylint --disable=R,C,W1203,W1309,E0611 app/*.py
	sudo docker run --rm -i hadolint/hadolint < Dockerfile


