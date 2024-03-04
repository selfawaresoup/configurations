#!/bin/bash

PATH=$PATH:/opt/homebrew/bin # M1 compatible homebrew bin
PATH=$PATH:/opt/homebrew/sbin # M1 compatible homebrew sbin
PATH=$PATH:$HOME/.bin # Add home .bin to PATH
PATH=$PATH:$HOME/.bin/node_modules/.bin
PATH=$PATH:$HOME/.cargo/bin # rust binaries
PATH=$PATH:/usr/local/bin # Homebrew bin
PATH=$PATH:/usr/local/sbin # Homebrew sbin
PATH=$PATH:/usr/local/share/npm/bin # NPM bins

