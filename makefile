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

.PHONY: all help install uninstall

all: help

help:
	@echo 'Usage: make [target]'
	@echo
	@echo 'targets:'
	@echo 'help         show this help'
	@echo 'install      install the program'
	@echo 'uninstall    uninstall the program'

install:
	./$(SRC_DIR)/install $(INSTALL_DIR)

uninstall:
	./$(SRC_DIR)/uninstall $(INSTALL_DIR)
