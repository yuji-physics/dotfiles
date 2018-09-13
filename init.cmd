@echo off

doskey ls=ls --color=auto --show-control-chars -N $*

doskey rm=rm -i $*

doskey cp=cp -i $*

doskey mv=mv -i $*


if "%CMD_INIT_SCRIPT_LOADED%" neq "" goto :eof

set ORIGINAL_PATH=%PATH%
set CMD_INIT_SCRIPT_LOADED=1


cls