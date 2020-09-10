## The Makefile includes instructions on environment setup and lint tests

setup:
	# Create virtualenv (Windows)
	virtualenv venv
	# Activate virtualenv
	source venv/Scripts/activate

activate:
	# Activate virtualenv
	source venv/Scripts/activate

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:

all: setup install lint
