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

## OTHERS

# sed script of automatic help generation from target comments
define HELP_GENERATOR
/^[a-zA-Z]\+:[a-zA-Z ]*#.*$$/!d
s/^\s*/  /
s/\s*:[^#]*//
s/#\+\s*/#/
s/#/<U+0023>/2g
endef
export HELP_GENERATOR

## RULES

.PHONY: all help install uninstall

all: help

help: # show this help
	@$(ECHO) 'Usage: make [TARGET]...'
	@$(ECHO)
	@$(ECHO) 'TARGET:'
	@$(SED) -e "$$HELP_GENERATOR" makefile | $(COLUMN) -t -s '#'

install: # launch an installation wizard of this program
	./$(SRC_DIR)/install $(INSTALL_DIR)

uninstall: # uninstall this program
	./$(SRC_DIR)/uninstall $(INSTALL_DIR)
