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

.PHONY: all help install uninstall version

# the default target
all: help

help: # display this help
	@$(ECHO) 'Usage: make [TARGET]...'
	@$(ECHO)
	@$(ECHO) 'TARGET:'
	@$(SED) -e "$$HELP_GENERATOR" makefile | $(COLUMN) -t -s '#'
	@$(ECHO)
	@$(ECHO) 'DESCRIPTION:'
	@$(ECHO) '  This program manages additional Linux configuration for ASUS ZenBook UX430UA.'

install: # launch an installation wizard of this program
	./$(SRC_DIR)/install $(INSTALL_DIR)

uninstall: # uninstall this program
	./$(SRC_DIR)/uninstall $(INSTALL_DIR)

version: # display version information
	@$(ECHO) 'asus-zenbook-ux430ua-linux-setup v1.0.2'
	@$(ECHO) 'Copyright (C) 2017-2018 Dominik Salvet'
	@$(ECHO) 'SPDX-License-Identifier: MIT'
