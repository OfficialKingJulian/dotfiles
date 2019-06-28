



" .VIMRC by Julian, using Vim Plug plugin manager
















" Vim Plug

  if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin('~/.vim/plugged')
      Plug 'mattn/emmet-vim'
      Plug 'junegunn/goyo.vim'
  call plug#end()












" Custom Stuff Goes Here
"
  " General
    set laststatus=2
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=utf-8
    set ttyfast
    set hlsearch

  " Fixing Line Breks
    :set wrap
    :set linebreak
    :set nolist  

  " Better Split Navigations
    :nnoremap <C-J> <C-W><C-J>
    :nnoremap <C-K> <C-W><C-K>
    :nnoremap <C-L> <C-W><C-L>
    :nnoremap <C-H> <C-W><C-H>
    :nnoremap <s-h> :vsplit 
    :nnoremap <s-v> :split 

  " Also, tabbing
    set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

  " Also, set the numbering as default 
    set number 

  " Better Copy-Paste (Ctrl-C, Ctrl-P, a to go to 
  " the end of the current
  " line).
  " ALSO added Ctrl-X
    :vnoremap <c-c> y
    :nnoremap <c-v> <s-p>
    :vnoremap a <c-$>
    :vnoremap <c-x> d

  " Ctrl-Z and Ctrl-Y
    :nnoremap <c-z> u
    :nnoremap <c-y> <c-r>

  " Ctrl-S
    :nnoremap <c-s> :w<CR>
    :vnoremap <c-s> :w<CR>
    :inoremap <c-s> <ESC>:w<CR>

  " Ammend Line
    :nnoremap <c-a> <s-$>a
    :nnoremap <c-o> <CR>o

  " Make searches case insensitive by default
    :nnoremap / /\c
    :nnoremap ? ?\c

  " Tab Multiple Lines in Visual
    :vnoremap <tab> >vgv
    :vnoremap <s-tab> <vgv

  " Select Whole Doc
    :vnoremap <c-a> <esc>ggvG





  " THIS IS STILL BROKEN
  " Fixing Odd Ghost Char issue https://stackoverflow.com/questions/6987317/
  " while-moving-the-cursor-across-a-vim-process-open-in-a-tmux-session-every-now-a
    map ^[OA <up>
    map ^[OB <down>
    map ^[OC <right>
    map ^[OD <left>
    set nocompatible






  " Signature
    :iabbrev jsign <cr>Kind Regards,<cr><cr>Julian Orchard ~ contact@julians.email

  " File-Specific Things
    :let mapleader = "-"
    :autocmd FileType html noremap <buffer> <leader>c 0i<!--<space><esc><s-$>a--><esc>
    :autocmd FileType html nnoremap <buffer> <leader>h1 <s-o><h1><esc>jo</h1>
    :autocmd FileType javascript noremap <buffer> <leader>c 0i//<space><space><esc><s-$>




  " THIS IS WHAT BREAKS THE THING 
  " Status Line
    "function! GitBranch()
      "return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    "endfunc

    "function! StatuslineGit()
      "let l:branchname = GitBranch()
      "return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
    "endfunc

    set statusline=\ \ \ 
    set statusline+=Julian\ VIM
    set statusline+=\ \ \ \ \ \
    set statusline+=%F%m%r%h%w\
    "set statusline+=%{StatuslineGit()}
    set statusline+=\ \ \ \ \ \ 
    set statusline+=Doc\ Type\:\ %Y
    set statusline+=\ \ \ \ \ \ 
    set statusline+=Doc\ Position\:\ %p%%
    set statusline+=\ \ \ \ \ \ 
    set statusline+=Docs\ Open\:\ %n\ \   
    set statusline+=%=%{strftime('%c')}
    set statusline+=\ \ \ 



    " Show syntax highlighting groups for word under cursor
      nmap <C-S-P> :call <SID>SynStack()<CR>
      function! <SID>SynStack()
        if !exists("*synstack")
          return
        endif
        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
      endfunc






































"
"      Keep this at the bottom of the file!
" Little Spell Check - update through the command 
"           :!spell <wrong> <correct>
"
  :iabbrev adn and
  :iabbrev maintainence maintenance
  :iabbrev flipendo fli<space>fli<space>flip<space>flipendooo
  :iabbrev excersise exercise
  :iabbrev exersise exercise
  :iabbrev apologize apologise
  :iabbrev proffessor professor
  :iabbrev febuary February
  :iabbrev sissors scissors
