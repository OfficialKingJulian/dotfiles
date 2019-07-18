function fish_prompt
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color blue
    echo -n '     >  '
end
set fish_greeting
function mkpdf 
  markdown-pdf
end
function cls
  clear
end
function cd..
  cd ..
end
function mk 
	mkdir $argv
	cd $argv
end
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH="~/sh/:$PATH"
