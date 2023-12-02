SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := help

# Constants
TAG ?= latest
DOCKERFILE ?= Dockerfile
IMAGE_NAME ?= cmpe58e

.PHONY: help build clean lint unit-test run deploy

help:
	@echo "Usage:"
	@echo "  make help      - Display this help message."
	@echo "  make build     - Build the Docker image."
	@echo "  make clean     - Remove the Docker image."
	@echo "  make lint      - Run code linting."
	@echo "  make unit-test - Run unit tests."
	@echo "  make run       - Run the service."
	@echo "  make deploy    - Deploy the Docker image to GCP."

build:
	@echo "Building Docker image: $(IMAGE_NAME):$(TAG)"
	@docker build -t $(IMAGE_NAME):$(TAG) -f $(DOCKERFILE) .

clean:
	@echo "Removing Docker image: $(IMAGE_NAME):$(TAG)"
	@docker rmi $(IMAGE_NAME):$(TAG)

lint:
	@echo "Running flake8 linting"
	@flake8

unit-test:
	@echo "Running unit tests"
	@python3 -m unittest discover -s tests

run: build
	@echo "Starting the service from image: $(IMAGE_NAME):$(TAG)"
	@docker run $(IMAGE_NAME):$(TAG)

deploy: build
	@echo "Deploying Docker image: $(IMAGE_NAME):$(TAG)"
	@bash scripts/push_gcp.sh
