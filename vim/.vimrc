" .VIMRC by Julian, using Vim Plug plugin manager
  set nocompatible








    """"""""""""""""""""""""""""""""
    """"     VIM Plug Setup     """"
    """"""""""""""""""""""""""""""""




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





    """"""""""""""""""""""""""""""""
    """" Custom Stuff Goes Here """"
    """"""""""""""""""""""""""""""""


  " General
     syntax on 
    :set laststatus=2
    :set encoding=utf-8
    :set fileencoding=utf-8
    :set fileencodings=utf-8
    :set ttyfast
    :set hlsearch
    :set title
    :set wildmenu
    :set nostartofline
    :set shortmess=atI
    :set history=1000
    :set lazyredraw
    :set noshowmatch


  " Fixing Line Breks
    :set wrap
    :set linebreak
    :set nolist  

  " Also, tabbing
    :set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

  " And Shifting
    :set shiftround
    :set autoindent
    :set smartindent 
    :set cpoptions  +=I

  " Also, just set the numbering as default 
    :set number 

  " Case Insensitive Searches, initially done with the \c remap
    :set ic

    :command Spell :set spell






    """""""""""""""""""""""""""""""""""
      """"""" FILE REMAPPINGS """"""
    """""""""""""""""""""""""""""""""""


  " Better Copy-Paste (Ctrl-C, Ctrl-P, a to go to 
  " the end of the current line)
  " ALSO added Ctrl-X
    :vnoremap <c-c> y
    :nnoremap <c-v> <s-p>
    :vnoremap a <c-$>
    :vnoremap <c-x> d
  
  " Ctrl-w+q to save and exit
    :nnoremap <c-w><c-q> :w!<CR>:q<CR>

  " Ctrl-Z and Ctrl-Y
    :nnoremap <c-z> u
    :nnoremap <c-y> <c-r>

  " Ctrl-S
    :nnoremap <c-s> :w<CR>
    :vnoremap <c-s> :w<CR>
    :inoremap <c-s> <ESC>:w<CR>

  " Ammend Line
    :nnoremap <c-a> <s-$>a
    ":nnoremap <c-o> <CR>o

  " Make searches case insensitive by default (as cool as this is, I am going
  " to just use the :set ic)
    ":nnoremap / /\c
    ":nnoremap ? ?\c

  " Highlight as pattern is typed
    set incsearch

  " Speaking of searches... Ctrl-f
    :nnoremap <c-f> /

  " Tab Multiple Lines in Visual
    :vnoremap <tab> >vgv
    :vnoremap <s-tab> <vgv

  " Select Whole Doc
    
  :vnoremap <c-a> <esc>ggvG

  " Easier Split Navigation
    :nnoremap <c-j> <C-W><C-J>
    :nnoremap <c-k> <C-W><C-K>
    :nnoremap <c-l> <C-W><C-L>
    :nnoremap <c-h> <C-W><C-H>

  " Arrow movements resize splits
    :nnoremap <s-j> :resize +2<CR>
    :nnoremap <s-k> :resize -2<CR>
    :nnoremap <s-h> :vertical resize +2<CR>
    :nnoremap <s-l> :vertical resize -2<CR>

  " Tab Cycle Through Splits
    :nnoremap <tab> <c-w><c-w>

  " Remove Arrow Key Functionality
    :noremap <Left> :echo "No left for you!"<CR>
    :noremap <Right> :echo "No right for you!"<CR>
    :noremap <Up> :echo "No up for you!"<CR>
    :noremap <Down> :echo "No down for you!"<CR>
  " visual
    :inoremap <Left> <nop>
    :inoremap <Right> <nop>
    :inoremap <Up> <nop>
    :inoremap <Down> <nop>
 

  " Make hjkl Graphical as default
    :nnoremap j gj
    :nnoremap k gk
  
  " 'd' Actually Deletes, not Cuts
    nnoremap d "_d
    vnoremap d "_d
    
  " Possibly the best thing ever
  " Causes splits to go to the right and below etc.
    set splitbelow 
    set splitright 






    """""""""""""""""""""""""""
    """ Status Bar Settings """
    """   (some is broken)  """
    """""""""""""""""""""""""""



  " THIS IS WHAT BREAKS THE THING 
  " Status Line
    "function! GitBranch()
      "return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    "endfunc

    "function! StatuslineGit()
      "let l:branchname = GitBranch()
      "return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
    "endfunc
                      " THIS IS STILL BROKEN
                      " Fixing Odd Ghost Char issue https://stackoverflow.com/questions/6987317/
                      " while-moving-the-cursor-across-a-vim-process-open-in-a-tmux-session-every-now-a
                        map ^[OA <up>
                        map ^[OB <down>
                        map ^[OC <right>
                        map ^[OD <left>
                        set nocompatible


    set statusline=\ \ \ 
    set statusline+=Julian\ VIM
    set statusline+=\ \ \ \ \ \ 
    set statusline+=%F%m%r%h%w\ 
    "set statusline+=%{StatuslineGit()}
    set statusline+=\ \ \ \ \ \ 
    set statusline+=File\ Type\:\ %Y
    set statusline+=\ \ \ \ \ \ 
    set statusline+=File\ Pos\:\ %p%%
    set statusline+=\ \ \ \ \ \ 
    set statusline+=Files\ Open\:\ %n\ \   
    set statusline+=%=%{strftime('%c')}
    set statusline+=\ \ \ \ \ 

    








" TO DO; THEME AND FILE SPECIFIC SETTINGS


    """""""""
    " THEME "
    """""""""


    " Show syntax highlighting groups for word under cursor
      nmap <C-S-P> :call <SID>SynStack()<CR>
      function! <SID>SynStack()
        if !exists("*synstack")
          return
        endif
        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "")')
      endfunc




  " File-Specific Things
  " TODO 
    :let mapleader = "-"
    :autocmd FileType html noremap <buffer> <leader>c 0i<!--<space><esc><s-$>a--><esc>
    :autocmd FileType html nnoremap <buffer> <leader>h1 <s-o><h1><esc>jo</h1>
    :autocmd FileType javascript noremap <buffer> <leader>c 0i//<space><space><esc><s-$>







    """""""""""""""""""""""""""""""""""""""""""""""""""
    "      Keep this at the bottom of the file!       "
    " Little Spell Check - update through the command "
    "           :!spell <wrong> <correct>             "
    """""""""""""""""""""""""""""""""""""""""""""""""""


" Signature ~ Unrelated to spelling, just neat 
  :iabbrev mailto Hello NAME, <cr><cr>EMAILCONTENT<cr><cr>Kind regards, <cr><cr>Julian Orchard ~<cr><cr>julian.marketing<cr>contact@julians.email<esc>? NAME<esc>c2w
  :iabbrev jsign <cr>Kind Regards,<cr><cr>Julian Orchard ~ contact@julians.email


" Added automatically by 'spell' script

  :iabbrev adn and
  :iabbrev maintainence maintenance
  :iabbrev flipendo fli<space>fli<space>flip<space>flipendooo
  :iabbrev excersise exercise
  :iabbrev exersise exercise
  :iabbrev apologize apologise
  :iabbrev proffessor professor
  :iabbrev febuary February
  :iabbrev sissors scissors
  :iabbrev indesign InDesign
