#-------------------------------------------------------------------------------
# Copyright (C) 2018 Dominik Salvet
# SPDX-License-Identifier: MIT
#-------------------------------------------------------------------------------

## ENVIRONMENT

# only bash is supported
SHELL := /bin/bash

## PROJECT

# directory definitions
SRC_DIR := src
INSTALL_DIR := /usr/local/bin

## RULES

.PHONY: all install uninstall

all:
	@echo 'Use "make install" to install the program.'

install:
	./$(SRC_DIR)/install $(INSTALL_DIR)

uninstall:
	@echo "Currently not supported."
