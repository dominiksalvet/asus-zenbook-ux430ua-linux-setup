#-------------------------------------------------------------------------------
# Copyright (C) 2018 Dominik Salvet
# SPDX-License-Identifier: MIT
# <https://github.com/dominiksalvet/asus-zenbook-ux430ua-linux-setup>
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# DEFINITIONS
#-------------------------------------------------------------------------------

# only bash is supported
SHELL := /bin/bash
ECHO := echo
SED := sed
COLUMN := column

# directory definitions
SRC_DIR := src
INSTALL_DIR := /usr/local/bin

# sed script of automatic help generation from target comments
define HELP_GENERATOR
/^[a-zA-Z]\+:[a-zA-Z ]*#.*$$/!d
s/^\s*/  /
s/\s*:[^#]*//
s/#\+\s*/#/
s/#/<U+0023>/2g
endef
export HELP_GENERATOR


#-------------------------------------------------------------------------------
# TARGETS
#-------------------------------------------------------------------------------

.PHONY: all install uninstall help about

# the default target
all: help

install: # launch an installation wizard of this program
	./$(SRC_DIR)/install $(INSTALL_DIR)

uninstall: # launch an uninstallation wizard of this program
	./$(SRC_DIR)/uninstall $(INSTALL_DIR)

help: # display this help
	@$(ECHO) 'Usage: make [TARGET]...'
	@$(ECHO)
	@$(ECHO) 'TARGET:'
	@$(SED) -e "$$HELP_GENERATOR" makefile | $(COLUMN) -t -s '#'

about: # display information about this program
	@$(ECHO) 'asus-zenbook-ux430ua-linux-setup 1.0.3'
	@$(ECHO) 'This program manages additional Linux configuration for ASUS ZenBook UX430UA.'
	@$(ECHO)
	@$(ECHO) 'Copyright (C) 2017-2018 Dominik Salvet'
	@$(ECHO) 'SPDX-License-Identifier: MIT'
	@$(ECHO) '<https://github.com/dominiksalvet/asus-zenbook-ux430ua-linux-setup>'
