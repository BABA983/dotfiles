# https://github.com/robb/dotfiles/blob/main/Makefile
all: link run
.PHONY: all link run

SHELL := /bin/bash

RUN  = $(wildcard **/*.install)
