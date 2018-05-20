#-------------------------------------------------------------------------------
# Copyright (C) 2018 Dominik Salvet
# SPDX-License-Identifier: MIT
#-------------------------------------------------------------------------------

## ENVIRONMENT

# only bash is supported
SHELL := /bin/bash
ECHO := echo
SED := sed
COLUMN := column

## PROJECT

# directory definitions
SRC_DIR := src
INSTALL_DIR := /usr/local/bin

## RULES

.PHONY: all help install uninstall

all: help

help: # show this help
	@$(ECHO) 'Usage: make [targets]'
	@$(ECHO)
	@$(ECHO) 'targets:'
	@$(SED) -e '/^[^#]\+:.*#.*$$/!d;s/\s*:[^#]*//;s/#\+\s*/#/;s/#/<NUMBER SIGN>/2g;' makefile | $(COLUMN) -t -s '#'

install: # launch an installation wizard of this program
	./$(SRC_DIR)/install $(INSTALL_DIR)

uninstall: # uninstall this program
	./$(SRC_DIR)/uninstall $(INSTALL_DIR)
