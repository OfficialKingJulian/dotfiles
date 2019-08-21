@echo off 

:: Installing some of these elements
:: on Windows (mainly for vim)
 
:: VIM
   mkdir ..\.vim
   xcopy vim\* ..\.vim\

:: BASH
   xcopy env\bashrc* ..\bashrc*
   ren ..\bashrc .bashrc

:: MINTTY
   xcopy env\minttyrc* ..\minttyrc*
   ren ..\minttyrc .minttyrc

