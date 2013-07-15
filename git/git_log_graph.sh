#!/bin/bash

git log --graph --date=short --format=format:'%w(200,0,4)%C(yellow)%ad %Cblue%aN%Creset: %Cgreen%h%Creset %C(magenta)%d%Creset %s' $@ && echo ""
