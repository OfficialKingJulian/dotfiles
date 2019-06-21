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

" Fixing Line Breks
  :set wrap
  :set linebreak
  :set nolist  

" Better Split Navigations
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

" Also, tabbing
  set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Also, set the numbering as default 
  set number 

" All of this is from here https://github.com/alvan/vim-closetag/blob/master/plugin/closetag.vim
if exists("g:loaded_closetag") | fini | en | let g:loaded_closetag = "1.8.11"
fun! s:Initial()
    call s:Declare('g:closetag_filetypes', 'html,xhtml,phtml')
    call s:Declare('g:closetag_xhtml_filetypes', 'xhtml')
    call s:Declare('g:closetag_filenames', '*.html,*.xhtml,*.phtml')
    call s:Declare('g:closetag_xhtml_filenames', '*.xhtml')
    call s:Declare('g:closetag_shortcut', '>')
    call s:Declare('g:closetag_close_shortcut', '')
    call s:Declare('g:closetag_emptyTags_caseSensitive', 0)
    call s:Declare('g:closetag_regions', {
        \ 'typescript.tsx': 'jsxRegion,tsxRegion',
        \ 'javascript.jsx': 'jsxRegion',
        \ })
    let g:closetag_filenames = substitute(g:closetag_filenames, '\s*,\s\+', ',', 'g')
    let g:closetag_xhtml_filenames = substitute(g:closetag_xhtml_filenames, '\s*,\s\+', ',', 'g')
    let g:closetag_filetypes = substitute(g:closetag_filetypes, '\s*,\s\+', ',', 'g')
    let g:closetag_xhtml_filetypes = substitute(g:closetag_xhtml_filetypes, '\s*,\s\+', ',', 'g')
    if g:closetag_shortcut != ''
        exec "au User vim-closetag inoremap <silent> <buffer> " . g:closetag_shortcut . " ><Esc>:call <SID>CloseIt()<Cr>"
        if g:closetag_filetypes != ''
            exec "au FileType " . g:closetag_filetypes . " inoremap <silent> <buffer> " . g:closetag_shortcut . " ><Esc>:call <SID>CloseIt()<Cr>"
        en
        if g:closetag_filenames != ''
            exec "au BufNewFile,Bufread " . g:closetag_filenames . " inoremap <silent> <buffer> " . g:closetag_shortcut . " ><Esc>:call <SID>CloseIt()<Cr>"
        en
    en
    if g:closetag_close_shortcut != ''
        if g:closetag_filetypes != ''
            exec "au FileType " . g:closetag_filetypes . " inoremap <silent> <buffer> " . g:closetag_close_shortcut . " >"
        en
        if g:closetag_filenames != ''
            exec "au BufNewFile,Bufread " . g:closetag_filenames . " inoremap <silent> <buffer> " . g:closetag_close_shortcut . " >"
        en
    en
    if g:closetag_xhtml_filetypes != ''
        exec "au FileType " . g:closetag_xhtml_filetypes . " call <SID>Declare('b:closetag_use_xhtml', 1)"
    en
    if g:closetag_xhtml_filenames != ''
        exec "au BufNewFile,Bufread " . g:closetag_xhtml_filenames . " call <SID>Declare('b:closetag_use_xhtml', 1)"
    en
    com! -nargs=* -complete=file CloseTagEnableBuffer let b:closetag_disabled = 0
    com! -nargs=* -complete=file CloseTagDisableBuffer let b:closetag_disabled = 1
    com! -nargs=* -complete=file CloseTagToggleBuffer let b:closetag_disabled = exists('b:closetag_disabled') && b:closetag_disabled ? 0 : 1
    let s:ReqAttrib = '\(\(\s\|\n\)\+\([^>= \t]\+=[^>&]\+\)\(\s\|\n\)*\)\+\(\/\)\@\<!>'
    let s:EndofName = '\($\|\s\|>\)'
endf
fun! s:Declare(var, def)
    if !exists(a:var)
        let {a:var} = a:def
    en
endf
fun! s:InitBuf()
    call s:Declare('b:did_ftplugin_closetag', 1)
    call s:Declare('b:closetag_emptyTags', '^\(area\|base\|br\|col\|command\|embed\|hr\|img\|input\|keygen\|link\|meta\|param\|source\|track\|wbr\)$')
    call s:Declare('b:closetag_firstWasEndTag', 0)
    call s:Declare('b:closetag_html_mode', 1)
    call s:Declare('b:closetag_haveAtt', 0)
    call s:Declare('b:closetag_use_xhtml', &filetype == 'xhtml' ? 1 : 0)
endf
fun! s:SavePos()
    retu 'call cursor('.line('.').','. col('.'). ')'
endf
fun! s:Handler(xml_tag, isHtml)
    let text = 0
    if a:isHtml == 1 && exists("*HtmlAttribCallback")
        let text = HtmlAttribCallback(a:xml_tag)
    elseif exists("*XmlAttribCallback")
        let text = XmlAttribCallback(a:xml_tag)
    en
    if text != '0'
        execute "normal! i " . text ."\<Esc>l"
    en
endf
fun! s:TagName(from)
    let l:end = match(getline('.'), s:EndofName,a:from)
    let l:tag = strpart(getline('.'),a:from, l:end - a:from)
    if strridx(l:tag, "\\") == strlen(l:tag) - 1
        let l:tag = ''
    en

    retu l:tag
endf
fun! s:HaveAtt()
    "Check if this open tag has attributes
    let l:line = line('.') | let l:col = col('.')
    if search(b:closetag_tagName . s:ReqAttrib,'W') > 0
        if l:line == line('.') && l:col == (col('.')-1)
            let b:closetag_haveAtt = 1
        en
    en
endf
fun! s:AsEmpty()
    retu g:closetag_emptyTags_caseSensitive == 1
                \ ? b:closetag_tagName =~# b:closetag_emptyTags
                \ : b:closetag_tagName =~? b:closetag_emptyTags
endf
fun! s:FindTag()
    let b:closetag_firstWasEndTag = 0
    let b:closetag_haveAtt = 0
    let l:haveTag = 0
    let l:stayCol = col('.')
    if getline('.')[col('.') - 1] == '>'
        if index([' ', '/', '%', '?', '=', '-'], getline('.')[col('.')-2]) >= 0
            retu l:haveTag
        en
    el
        retu l:haveTag
    en
    if search('[<>]','bW') >=0
        if getline('.')[col('.')-1] == '<'
            if getline('.')[col('.')] == '/'
                let b:closetag_firstWasEndTag = 1
                let b:gotoCloseTag = s:SavePos()
            elseif getline('.')[col('.')] == '?' ||  getline('.')[col('.')] == '!'
                "we don't deal with processing instructions or dtd
                "related definitions
                retu l:haveTag
            el
                let b:gotoOpenTag = s:SavePos()
            en
        el
            retu l:haveTag
        en
    el
        retu l:haveTag
    en
    let l:str = strpart(getline('.'),col('.'), l:stayCol - col('.'))
    if (strlen(l:str) - strlen(substitute(substitute(substitute(l:str, '\\\\', '', 'g'), '\\"', '', 'g'), '"', '', 'g'))) % 2
        retu l:haveTag
    en
    let b:closetag_tagName = s:TagName(col('.') + b:closetag_firstWasEndTag)
    if b:closetag_tagName == ''
        retu l:haveTag
    en
    let l:haveTag = 1
    if b:closetag_firstWasEndTag == 0
        call s:HaveAtt()
        if exists('b:gotoOpenTag') && b:gotoOpenTag != ''
            exe b:gotoOpenTag
        en
    en
    retu l:haveTag
endf
fun! s:InValidRegion()
    let l:regions = get(g:closetag_regions, &filetype, '')
    if l:regions == ''
        " no restrictions? no problem
        return 1
    en
    let l:regionStack = synstack(line('.'), col('.'))
    for id in l:regionStack
        let l:regionName = synIDattr(id, "name")
        if stridx(l:regions, l:regionName) != -1
            retu 1
        en
    endfor
    retu 0
endf
fun! s:CloseIt()
    if !exists("b:did_ftplugin_closetag")
        call s:InitBuf()
    en

    if !(exists("b:closetag_disabled") && b:closetag_disabled) && s:InValidRegion()
        let l:restore = s:SavePos()

        let l:endOfLine = ((col('.')+1) == col('$'))
        if col('.') > 1 && getline('.')[col('.')-2] == '>'
            let l:line = line('.')
            "Multiline request. <t>></t> -->
            "<t>
            "        cursor comes here
            "</t>
            normal! h
            if s:FindTag()
                if b:closetag_firstWasEndTag == 0
                    if l:line > 0 && l:line != line('.')
                        exe "normal! " . l:line . "gg"
                    en
                    if exists('b:did_indent') && b:did_indent == 1
                        exe "normal! 2f>a\<Cr>\<Esc>k$i\<Cr>\<Esc>$"
                    else
                        exe "normal! 2f>a\<Cr>\<Esc>k$i\<Cr>\<Esc>>>$"
                    en
                    call setline('.', strpart(getline('.'), 0, strlen(getline('.'))-1))

                    if col('.') >= col('$') | start | el | start! | en
                    retu
                en
            en
        elseif s:FindTag()
            if b:closetag_firstWasEndTag == 0
                exe "silent normal! />\<Cr>"
                if b:closetag_html_mode && s:AsEmpty()
                    if b:closetag_haveAtt == 0
                        call s:Handler(b:closetag_tagName, b:closetag_html_mode)
                    en
                    if b:closetag_use_xhtml
                        exe "normal! i/\<Esc>l"
                    en
                    if l:endOfLine
                        start!
                        retu
                    el
                        normal! l
                        start
                        retu
                    en
                el
                    if b:closetag_haveAtt == 0
                        call s:Handler(b:closetag_tagName, b:closetag_html_mode)
                    en
                    exe "normal! a</" . b:closetag_tagName . ">\<Esc>F<"
                    start
                    retu
                en
            en
        en
        exe l:restore
    en

    if (col('.')+1) == col("$")
        startinsert!
    else
        normal! l
        startinsert
    en
endf
call s:Initial()


