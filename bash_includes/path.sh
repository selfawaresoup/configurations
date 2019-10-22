#!/bin/bash

PATH=/usr/local/opt/ruby/bin:$PATH # homebrew ruby
PATH=/usr/local/lib/ruby/gems/2.6.0/bin:$PATH # homebrew gems
PATH=/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH # python3


PATH=$PATH:$HOME/.bin # Add home .bin to PATH
PATH=$PATH:$HOME/.bin/node_modules/.bin
PATH=$PATH:$HOME/.cargo/bin # rust binaries
PATH=$PATH:/usr/local/bin # Homebrew bin
PATH=$PATH:/usr/local/sbin # Homebrew sbi
PATH=$PATH:/usr/local/share/npm/bin # NPM bins

PATH=$PATH:$HOME/Library/Android/sdk/tools # Android SDK tools
PATH=$PATH:$HOME/Library/Android/sdk/platform-tools # Android SDK tools

