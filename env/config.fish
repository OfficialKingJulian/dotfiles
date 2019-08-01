# Fish Config
  function fish_prompt
      set_color $fish_color_cwd
      set_color yellow
      echo -n '$ '
      set_color blue
      echo -n 'Julian-Server '
      set_color yellow
      echo -n '@ '
      set_color purple
      echo -n (prompt_pwd)
      set_color yellow
      echo -n ' > '
  end
  set fish_greeting
  function mkpdf 
    markdown-pdf
  end
  function cls
    clear
  end
  function mk 
    mkdir $argv
    cd $argv
  end
  function cointop
    snap run cointop
  end
  function weather
    curl http://wttr.in/southampton
  end
  export VISUAL=vim
  export EDITOR="$VISUAL"
  export PATH="~/dotfiles/:$PATH"
