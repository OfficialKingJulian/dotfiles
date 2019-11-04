@echo off 


:: Installing some of these elements
:: on Windows (mainly for vim)
 
setlocal enabledelayedexpansion

  :: BASH
          xcopy env\bashrc* ..\bashrc*
          ren ..\bashrc .bashrc

  :: MINTTY
            xcopy env\minttyrc* ..\minttyrc*
            ren ..\minttyrc .minttyrc


  :: GitHub Setup
    echo/
    set /p input=Would you like to set up github? (y/n) 
    if !input! == y ( 
      set /p gituser=Github Username: 
      set /p gitmail=Github Email: 
      git config --global user.name "!gituser!"
      git config --global user.email !gitmail!
      echo/
      echo Git Config: 
  :: This is such a weird thing, but 
  :: it was initially because I was
  :: working around git config -l
      git config user.name   >9fu3nldijfn.txt
      git config user.email >>9fu3nldijfn.txt
      type 9fu3nldijfn.txt
      del  9fu3nldijfn.txt
      echo/
      echo Files Copied, Git setup
      echo/
    ) else (
      echo/ 
      echo Everything should be set up^!
    )

