# Makefile

IMAGE_NAME = treesitter

CURRENT_DIR = $(shell pwd)

build:
	docker build -t $(IMAGE_NAME) .

shell:
	docker run -it --rm -v $(CURRENT_DIR)/src:/app/src $(IMAGE_NAME) /bin/bash

# コンテナ内のみで使用
run:
	ruby src/auto_insertion.rb

clean:
	docker rmi $(IMAGE_NAME)

	.PHONY: build run clean
