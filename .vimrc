" vimrc
"
" Managed at: https://github.com/rcmdnk/dotfiles/blob/master/.vimrc
" Todo/Obsolete settings are in https://github.com/rcmdnk/dotfiles/blob/master/.vimrc.not_used

" vi compatiblity {{{
if !&compatible
  " disable vi compatible mode (much better!)
  set nocompatible
endif
" }}}

" Prepare .vim dir {{{
if has("vim_starting")
  let g:vimdir=$HOME . "/.vim"
  if ! isdirectory(g:vimdir)
    call system("mkdir " . g:vimdir)
  endif
endif
" }}}

" neobundle {{{

"" usage:
" :NeoBundleUpdate " update plugins below
" :NeoBundleInstall" install plugins below
" :NeoBundleClean  " remove plugins removed from below

" NeoBundle configuration ref:
" http://qiita.com/rbtnn/items/39d9ba817329886e626b

let s:neobundle_enable=0
if v:version > 702
  " set path
  if has("vim_starting")
    let g:bundledir=g:vimdir . "/bundle"
    let g:neobundledir=g:bundledir . "/neobundle.vim"
    let &runtimepath = &runtimepath . "," . g:neobundledir
    let g:neobundleReadMe=expand(g:neobundledir . '/README.md')
    if !filereadable(g:neobundleReadMe)
      echo "Neobundle is not installed, install now "
      echo "git clone git://github.com/Shougo/neobundle.vim "
            \ .  g:neobundledir
      call system("git clone git://github.com/Shougo/neobundle.vim "
            \ .  g:neobundledir)
    endif
    let s:neobundle_enable=1
  endif

  call neobundle#rc(g:bundledir)

  """"plugins"""""

  " Neobundle
  NeoBundleFetch "Shougo/neobundle.vim"

  " Make templete of NeoBundle
  NeoBundleLazy 'LeafCage/nebula.vim',{
    \'autoload':{
      \'commands':[
        \'NebulaPutLazy', 'NebulaPutFromClipboard',
        \'NebulaYankOptions', 'NebulaPutConfig']}}

  " Asynchronous execution library: need for vimshell, Gmail, unite, etc...
  NeoBundle 'Shougo/vimproc', {
    \'build' : {
      \'windows' : 'make -f make_mingw32.mak',
      \'cygwin' : 'make -f make_cygwin.mak',
      \'mac' : 'make -f make_mac.mak',
      \'unix' : 'make -f make_unix.mak'}}

  " Searches and display information->:help Unite
  " Unlike "fuzzyfinder" or "ku", it doesn't use the built-lin completion of vim
  NeoBundleLazy 'Shougo/unite.vim' , {
    \ 'autoload' : { 'commands' : [ 'Unite' ] }}

  " Source for unite: mark
  NeoBundle 'tacroe/unite-mark'

  " Source for unite: outline
  NeoBundle 'h1mesuke/unite-outline'

  " Source for unite: help
  NeoBundle 'tsukkee/unite-help'

  " Source for unite: history/command, history/search
  NeoBundle 'thinca/vim-unite-history'

  " Source for unite: fold
  NeoBundle 'osyo-manga/unite-fold'

  " Source for unite: locate
  NeoBundle 'ujihisa/unite-locate'

  " Echo
  NeoBundleLazy 'Shougo/echodoc', {
    \ "autoload": { "insert": 1 }}

  " Completion
  if has('lua') && (( v:version >= 703 && has('patch885')) || (v:version >= 704))
    NeoBundleLazy "Shougo/neocomplete.vim", {
      \ "autoload": {"insert": 1 }}
  else
    NeoBundleLazy "Shougo/neocomplcache", {
      \ "autoload": { "insert": 1 }}
  endif

  NeoBundleLazy "Shougo/neosnippet", {
    \ "autoload": { "insert": 1 }}

  NeoBundle "Shougo/neobundle-vim-scripts"

  " look - display lines beginning with a given string, using with neocomplete/neocomplcache
  NeoBundle 'ujihisa/neco-look'

  " gundo
  NeoBundleLazy "sjl/gundo.vim", {
    \ "autoload": {"commands": ["GundoToggle"]}}

  " textobj {{{
  NeoBundle "kana/vim-textobj-user"

  " entire: ae, ie
  NeoBundle "kana/vim-textobj-entire"

  " line: al, il
  NeoBundle "kana/vim-textobj-line"

  " function: af, if
  NeoBundle "kana/vim-textobj-function"

  " syntax: ay, iy
  NeoBundle "kana/vim-textobj-syntax"

  " jabraces: ajb, ijb
  NeoBundle "kana/vim-textobj-jabraces"

  " last pattern: a/, i/
  NeoBundle "kana/vim-textobj-lastpat"

  " indent: al, il
  NeoBundle "kana/vim-textobj-indent"

  " fold: az, iz
  NeoBundle "kana/vim-textobj-fold"

  " diff(1): adf, idf
  NeoBundle "kana/vim-textobj-diff"

  " datetime: ada, ida
  NeoBundle "kana/vim-textobj-datetime"

  " underscore: a_, i_
  NeoBundle "kana/vim-textobj-underscore"

  " django_template: adb, idb
  NeoBundle "kana/vim-textobj-django-template"

  " between: af, if
  NeoBundle "thinca/vim-textobj-between"

  " comment: ac, ic
  NeoBundle "thinca/vim-textobj-comment"

  " JavaScript Function: af, if
  NeoBundle "thinca/vim-textobj-function-javascript"

  " Perl Function: af, if
  NeoBundle "thinca/vim-textobj-function-perl"

  " last paste: ap, ip
  NeoBundle "gilligan/textobj-lastpaste"

  " mbboundary: am, im
  NeoBundle "deton/textobj-mbboundary.vim"

  " xml attribute: axa, ixa
  NeoBundle "akiyan/vim-textobj-xml-attribute"

  " php: aP, iP
  NeoBundle "akiyan/vim-textobj-php"

  " space: aS, iS
  NeoBundle "saihoooooooo/vim-textobj-space"

  " URL: au, iu
  NeoBundle "mattn/vim-textobj-url"

  " snake_case: a,w, i,w
  NeoBundle "h1mesuke/textobj-wiw"

  " lastinserted: au, iu
  NeoBundle "rhysd/vim-textobj-lastinserted"

  " continuous line: av, iv
  NeoBundle "rhysd/vim-textobj-continuous-line"

  " ruby: arr, brr
  NeoBundle "rhysd/vim-textobj-ruby"

  " xbrackets: axb, ixb
  NeoBundle "https://bitbucket.org/anyakichi/vim-textobj-xbrackets"

  " motionmotion: am, im
  NeoBundle "hchbaw/textobj-motionmotion.vim"

  " enclosedsyntax: aq, iq
  NeoBundle "deris/vim-textobj-enclosedsyntax"

  " headwordofline: ah, ih
  NeoBundle "deris/vim-textobj-headwordofline"

  " LaTeX: ae, ie
  NeoBundle "rbonvall/vim-textobj-latex"

  " parameter: a, i,
  NeoBundle "sgur/vim-textobj-parameter"

  " cell: ac, ic
  NeoBundle "mattn/vim-textobj-cell"

  " context: icx
  NeoBundle "osyo-manga/vim-textobj-context"

  " multiblock: asb, isb
  NeoBundle "osyo-manga/vim-textobj-multiblock"

  " indblock: ao, io
  NeoBundle "glts/vim-textobj-indblock"

  " dash: a-, i-
  NeoBundle "RyanMcG/vim-textobj-dash"

  " Python af, if
  NeoBundle "bps/vim-textobj-python"

  " #ifdef: a#, i#
  NeoBundle "anyakichi/vim-textobj-ifdef"

  " HTML: ahf, ihf
  NeoBundle "mjbrownie/html-textobjects"

  " keyvalue: dak, dik,  dav, div
  NeoBundle "vimtaku/vim-textobj-keyvalue"
  "}}}

  " operator {{{
  NeoBundle 'emonkak/vim-operator-sort'
  NeoBundle 'tyru/operator-reverse.vim'
  "}}}

  " smart input
  NeoBundle "kana/vim-smartinput"

  " smart word
  NeoBundle 'kana/vim-smartword'

  " Easy to change surround
  NeoBundle "surround.vim"

  " Align
  NeoBundle "h1mesuke/vim-alignta"

  " c++ syntax with c++11 support
  NeoBundle "vim-jp/cpp-vim"

  " CSS3 (Sass)
  NeoBundle "hail2u/vim-css3-syntax.git"

  " Markdown syntax
  NeoBundle "plasticboy/vim-markdown"

  " Folding method for python, but makes completion too slow...?
  "NeoBundle "vim-scripts/python_fold"

  " Python syntax
  NeoBundle "mitsuhiko/vim-python-combined"

  " Java
  NeoBundle "koron/java-helper-vim"

  " JavaScript
  NeoBundle "marijnh/tern_for_vim"

  " Applescript
  NeoBundle "applescript.vim"

  " Another status line
  NeoBundle 'itchyny/lightline.vim'

  " Visual indent guides: make moving slow?
  NeoBundle "nathanaelkane/vim-indent-guides"

  " Sub mode
  NeoBundle "kana/vim-submode"

  " Operator
  NeoBundle "kana/vim-operator-user"

  " Replace with the text object
  NeoBundle "kana/vim-operator-replace"

  " Open browser
  NeoBundleLazy "tyru/open-browser.vim", { "autoload": {
    \ "mappings" : "<Plug>(openbrowser-smart-search)"}}

  " Open browser GitHub
  NeoBundleLazy "tyru/open-browser-github.vim", {
    \ "depends": ["tryu/open-browser.vim"],
    \ "autoload": { "commands" : ["OpenGithubFile","OpenGithubIssue"] }}

  " Easymotion
  NeoBundle "Lokaltog/vim-easymotion"

  " Can use f instead of ;, after fx move
  " Can move even to other lines
  NeoBundle "rhysd/clever-f.vim"

  " Python autocompletion
  NeoBundleLazy "davidhalter/jedi-vim", {
    \ "rev" : "dev",
    \ "autoload": { "filetypes": [ "python", "python3", "djangohtml"] }}

  " virtual env
  NeoBundle "jmcantrell/vim-virtualenv"

  " Syntax
  NeoBundle "scrooloose/syntastic"

  " Count searching objects
  NeoBundle "osyo-manga/vim-anzu"

  " Git
  NeoBundle "tpope/vim-fugitive" " necessary ('depends' in gitv is not enough.)
  NeoBundleLazy "gregsexton/gitv", {
    \ "depends": ["tpope/vim-fugitive"],
    \ "autoload": { "commands": ["Gitv"]}}

  " Show added/deleted/modified lines for several version control system
  NeoBundle "mhinz/vim-signify"

  " For git/svn status, log
  NeoBundleLazy "hrsh7th/vim-versions.git", {
    \ "autoload": { "commands": ["UniteVersions"]}}

  " Gist
  NeoBundleLazy "mattn/gist-vim", {
    \ "depends": ["mattn/webapi-vim"],
    \ "autoload": {"commands": ["Gist"] }}

  " Date increment
  NeoBundle "tpope/vim-speeddating"

  " Table
  NeoBundle "dhruvasagar/vim-table-mode"

  " vim-ref
  NeoBundleLazy "thinca/vim-ref", {
    \  "autoload" : {"commands": ["Ref"] }}

  " LanguageTool
  NeoBundle "vim-scripts/LanguageTool"

  " Excite Translate
  NeoBundleLazy "mattn/excitetranslate-vim", {
    \ "depends": "mattn/webapi-vim",
    \ "autoload" : { "commands": ["ExciteTranslate"] }}

  " Habatobi
  NeoBundleLazy "mattn/habatobi-vim",{
    \ "autoload" : {"commands": ["Habatobi"] }}

  " Make benchmark result of vimrc
  NeoBundleLazy "mattn/benchvimrc-vim",{
    \ "autoload" : {"commands": ["BenchVimrc"] }}

  " File Explorer
  NeoBundleLazy "wesleyche/SrcExpl", {
    \ "autoload" : { "commands": ["SrcExpl", "SrcExplClose", "SrcExplToggle"] }}

  " For Tags
  NeoBundleLazy "majutsushi/tagbar", {
    \ "autload": { "commands": ["TagbarToggle"] }}

  " Make help
  NeoBundleLazy "LeafCage/vimhelpgenerator",{
    \ "autoload" : {"commands": ["VimHelpGenerator"] }}


  " local plugins
  NeoBundleLocal ~/.vim/local/bundle
  """"plugins end"""""

  " Installation check.
  NeoBundleCheck
endif

" Enable plugin, indent again
filetype plugin indent on

" Switch syntax highlighting on, when the terminal has colors
syntax on
" }}} neobundle

" Basic settings {{{

" Set my auto group
augroup MyAutoGroup
  autocmd!
augroup END

" Switch on highlighting the last used search pattern.
set hlsearch

" mapleaader (<Leader>)
let mapleader = ","
" use \ as ,, instead
noremap <Subleader> <Nop>
nmap \ <Subleader>
noremap <Subleader>, ,

" allow backspacing over everything in insert mode
" indent: spaces of the top of the line
" eol   : break
" start : character before the starting point of the insert mode
set backspace=indent,eol,start

set modeline       " enable to use settings written in the file
                   " use with comment lines: e.g.)
                   " # vim set foldmethod=marker:
                   " # vim set foldmarker={{{,}}}:
set modelines=3    " number of lines to be read (form top and bottom) for
                   " modeline
set tabstop=4      " width of <Tab> in view

set shiftwidth=2   " width for indent
set softtabstop=0  " if not 0, insert space instead of <Tab>
"set textwidth=0    " longer line than textwidth will be broken (0: disable)
autocmd MyAutoGroup FileType *  setlocal textwidth=0 " overwrite ftplugin settings
if exists ("&colorcolumn")
  "set colorcolumn=80 " put line on 80
  "set colorcolumn=+1 " put line on textwidth+1
  " Change background for 81-
  execute "set colorcolumn=" . join(range(81, 999), ",")
endif
set wrap           " the longer line is wrapped
set expandtab      " do :retab -> tab->space

set nobackup       " do not keep a backup file, use versions instead

if ! empty($TMP) && isdirectory($TMP)
  let s:tmpdir=$TMP
elseif ! empty($TMPDIR) && isdirectory($TMPDIR)
  let s:tmpdir=$TMPDIR
elseif ! empty($TEMP) && isdirectory($TEMP)
  let s:tmpdir=$TEMP
else
  let s:tmpdir="./"
endif
let &directory=s:tmpdir
let &backupdir=s:tmpdir

if has("gui_running") && ( has("win32unix") || has ("win64unix") || has("win32") || has ("win64") )
  set viminfo+=n~/.vim/gviminfo
else
  set viminfo+=n~/.vim/viminfo
endif

set history=100    " Keep 100 lines of command line history

set incsearch      " Do incremental searching
set ignorecase     " Ignore case for search
set smartcase      " Noignorecase, if the pattern include Capital
set nowrapscan     " Stop search at the edge of the file
set infercase      " Ignore case for completion

set nrformats=hex  " Not use cotal, alpha for increment or decrement
set t_Co=256       " Enable 256 colors
set list           " Show tab, end, trail empty
set listchars=tab:>-,extends:<,trail:- " Set words for above
set ruler          " Show the cursor position all the time
set showcmd        " Display incomplete commands
set novisualbell   " No visual bell
"set cursorline     " Enable highlight on current line:
"                   " but make moving cursor slow for heavily highlighted file...
"set number         " Show line numbers
"set relativenumber " Relative line number
set autoindent
set scrolloff=999  " Show cursor at middle
                   " (scrolloff is number of lines which should be shown above
                   " and below cursor.
                   "  such large number force to stay a cursor at middle
set scroll=0       " Number of lines to scroll with C-U/C-D (0 for half window)
"set spell          " Spell check highlight
"set nospell        " No spell check
set mouse=         " Disable mouse
set ambiwidth=double  " For UTF-8, width for East Asian Characters
set cmdheight=1    " Command line height
set showmatch      " Show maching one for inserted bracket


" IME setting
if has("multi_byte_ime") || has("xim") || has("gui_macvim")
  set iminsert=0
  set imsearch=0
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

" Encode
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin

" bash-like tab completion
set wildmode=list:longest
set wildmenu

" Folding
set foldmethod=marker
set foldmarker={{{,}}} "default
autocmd MyAutoGroup FileType py set foldmethod=syntax
autocmd MyAutoGroup FileType cpp,cxx,C set foldmethod=marker foldmarker={,}
set foldlevel=0
set foldnestmax=1

" When editing a file, always jump to the last known cursor position.
autocmd MyAutoGroup BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Avoid automatic comment out for the next line after the comment lines
autocmd MyAutoGroup FileType * setlocal formatoptions-=ro

" Arrow to open new file while current file is not saved
set hidden

" Jump to the first open window
set switchbuf=useopen

" virtualedit (can move to non-editing places: e.x. right of $)
set virtualedit=all

" Avoid to paste/insert in non-editing place
if has("virtualedit") && &virtualedit =~# '\<all\>'
  nnoremap <expr> p (col('.') >= col('$') ? '$' : '') . 'p'
  nnoremap <expr> i (col('.') >= col('$') ? '$' : '') . 'i'
  nnoremap <expr> a (col('.') >= col('$') ? '$' : '') . 'a'
  nnoremap <expr> r (col('.') >= col('$') ? '$' : '') . 'r'
  nnoremap <expr> R (col('.') >= col('$') ? '$' : '') . 'R'
  nnoremap <expr> . (col('.') >= col('$') ? '$' : '') . '.'
  " autocmd is needed to overwrite YRShow's map,
  " and "_x to avoid register 1 letter
  autocmd MyAutoGroup FileType * nnoremap <expr> x (col('.') >= col('$') ? '$' : '') . '"_x'
endif

" Max columns for syntax search
" Such XML file has too much syntax which make vim drastically slow
set synmaxcol=200 "default 3000

" Disable highlight italic in Markdown
autocmd! FileType markdown hi! def link markdownItalic LineNr

" }}} Basic settings

" map (for other than each plugin){{{
" remapping, tips

" n   Normal mode map. Defined using ':nmap' and ':nnoremap'.
" i   Insert mode map. Defined using ':imap' and ':inoremap'.
" v   Visual and select mode map. Defined using ':vmap' and ':vnoremap'.
" x   Visual mode map. Defined using ':xmap' and ':xnoremap'.
" s   Select mode map. Defined using ':smap' and ':snoremap'.
" c   Command-line mode map. Defined using ':cmap' and ':cnoremap'.
" o   Operator pending mode map. Defined using ':omap' and ':onoremap'.
"
" map and noremap:  normal + visual
" nmap! and nnoremap!: other than normal mode
"
" Note that if the 'paste' option is set, then insert mode maps are disabled.

" <C-h> == <BS>
" <C-i> == <Tab>
" <C=l> == <FF> (formfeed)
" <C-j> == <NL> (next line)
" <C=m> == <CR> (return)
" *** should not use <C-i> and <C-m> for mappings!
" If you set mappings for <C-i> and <C-m>,
" the mapping will also be enabled for <Tab> and <CR>, respectively.
" Others can be mapped separately.

" fix meta-keys
nmap <ESC>p <M-p>
nmap <ESC>n <M-n>

""" normal mode (noremap)

" cursor move
" Left (C-h default: <BS> ~ h)
"nnoremap <C-h> h
" Right (C-j default: <NL> ~ j)
"nnoremap <C-j> j
" Up (C-k default: Non)
nnoremap <C-k> k
" Down (C-l default: Clear and redraw the screen)
nnoremap <C-l> l
" Go to Head (C-a default: Increment)
nnoremap <C-a> 0
" Go to End (C-e default: Scroll down)
nnoremap <C-e> <C-$>
" Substitute for C-a (C-q default: C-V alternative for gui mode)
"nnoremap <C-q> <C-a> " not work...
" Substitute for C-a (C-z default: suspend, same as :stop)
"nnoremap <C-z> <C-a>
" Substitute for C-a (C-s default: non?)
" C-a should be map for vim-speeddating
map <C-s> <C-a>
nnoremap <C-k> k

" Swap colon <-> semicolon
noremap ; :
noremap : ;

" tag jump (avoid crash with screen's key bind, C-' default: Non?)
nnoremap <C-'> <C-t>

" spell check toggle
nnoremap <silent> <Leader>s :set spell!<CR>

" stop highlight for search
nnoremap <silent> <Leader>/ :noh<CR>

" alignment at normalmode
nnoremap = v=

" insert file name
"nnoremap <silent> ,f i<CR><Esc><BS>:r!echo %<CR>i<BS><Esc>Jx
nnoremap <silent> <Leader>f "%P
nnoremap <silent> <Leader>d i<CR><Esc><BS>:r!echo %:p:h<CR>i<BS><Esc>Jx
nnoremap <silent> "+ "+P
nnoremap <silent> "* "*P

" save/quit
"nnoremap <Leader>w :w<CR>
"nnoremap <Leader>q :q<CR>
"nnoremap <Leader>wq :wq<CR>
"nnoremap <Leader>1 :q!<CR>
nnoremap W :w<CR>
nnoremap ! :q!<CR>
nnoremap Z ZZ
" don't enter Ex mode but quit w/o check by Q
nnoremap Q ZQ

" remove trail spaces
nnoremap <Leader><Space>  :%s/<Space>\+$//g<CR><C-o>

" Paste mode
nnoremap <silent> <Leader>p "+gP
nnoremap <silent> <Leader>P :set paste!<CR>:set paste?<CR>

" Open vimrc
nnoremap <Leader><Leader> :tabedit $MYVIMRC<CR>

" Source vimrc
nnoremap <Leader>. :source $MYVIMRC<CR>

" search: very magic mode
nnoremap / /\v
" to check patterns:
" :h pattern-overview

" Close help with q
autocmd MyAutoGroup FileType help,qf nnoremap <buffer> q <C-w>c

" Surround at Normal mode
nnoremap <Leader>{ bi{<Space><Esc>ea<Space>}<Esc>
nnoremap <Leader>} bi{<Esc>ea}<Esc>
nnoremap <Leader>[ bi[<Space><Esc>ea<Space>]<Esc>
nnoremap <Leader>] bi[<Esc>ea]<Esc>
nnoremap <Leader>( bi(<Space><Esc>ea<Space>)<Esc>
nnoremap <Leader>) bi(<Esc>ea)<Esc>
nnoremap <Leader>< bi<<Space><Esc>ea<Space>><Esc>
nnoremap <Leader>> bi<<Esc>ea><Esc>
nnoremap <Leader>" bi"<Esc>ea"<Esc>
nnoremap <Leader>' bi'<Esc>ea'<Esc>
nnoremap <Leader>` bi`<Esc>ea`<Esc>

""" insert mode (inoremap)

" emacs (bash) like move in insert mode
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Delete>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

""" visual mode (vnoremap)

" remove trail spaces
vnoremap <Leader><Space>  :s/<Space>\+$//g<CR><C-o>

" Select word
vnoremap w iw
vnoremap W iW

""" command line mode (cnoremap)
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <C-b>

" Write as root
cnoremap w!! w !sudo tee > /dev/null %

" }}} map

" Colors {{{
colorscheme ron

" for spell checks
hi SpellBad cterm=inverse ctermbg=0

"hi CursorLine cterm=none ctermfg=NONE ctermbg=NONE
" only underline for cursorline
"hi CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
" Set all white characters on black background for current line
"hi CursorLine cterm=underline ctermfg=white ctermbg=black
"au MyAutoGroup InsertEnter * hi CursorLine cterm=underline,bold ctermfg=NONE ctermbg=NONE
"au MyAutoGroup InsertLeave * hi CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

" colors for completion
hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
hi PmenuSel ctermbg=blue ctermfg=black
hi PmenuSbar ctermbg=0 ctermfg=9
hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF

" column
hi ColorColumn ctermbg=234

"" colors for diff mode
hi DiffAdd ctermbg=17 guibg=slateblue
hi DiffChange ctermbg=22 guibg=darkgreen
hi DiffText cterm=bold ctermbg=52 gui=bold guibg=olivedrab
hi DiffDelete term=bold ctermfg=12 ctermbg=6 gui=bold guifg=Blue guibg=coral

"" Colors for search
hi Search term=reverse ctermfg=Red ctermbg=11 guifg=Black
" }}} colorscheme

" diff mode {{{
if &diff
  "set wrap " not work...
  set nospell
endif
function! SetDiffWrap()
  if &diff
    set wrap
    wincmd w
    set wrap
    wincmd w
  endif
endfunction
autocmd MyAutoGroup VimEnter,FilterWritePre * call SetDiffWrap()
" }}} diff mode

" DiffOrig {{{
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
" }}} DiffOrig

" undo {{{
if has("persistent_undo")
  let vimundodir=expand("~/.vim/undo")
  let &undodir = vimundodir
  if ! isdirectory(vimundodir)
    call system("mkdir " . vimundodir)
  endif
  set undofile
  set undoreload=1000
endif
set undolevels=1000
nnoremap u g-
nnoremap <C-r> g+
" }}} undo

" gundo {{{
if s:neobundle_enable && ! empty(neobundle#get("gundo.vim"))
  nnoremap U :GundoToggle<CR>
  let g:gundo_width = 30
  let g:gundo_preview_height = 15
  let g:gundo_auto_preview = 0 " Don't show preview by moving history. Use r to see differences
  let g:gundo_preview_bottom = 1 " Show preview at the bottom
endif
" }}} gundo

" Unite {{{
if s:neobundle_enable && ! empty(neobundle#get("unite.vim"))
  autocmd MyAutoGroup FileType unite call s:unite_my_settings()
  function! s:unite_my_settings()
    nmap <buffer><Esc> <Plug>(unite_exit)
    imap <buffer> jj      <Plug>(unite_insert_leave)
    "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

    imap <buffer><expr> j unite#smart_map('j', '')
    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x
            \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
    nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    nnoremap <silent><buffer><expr> l
            \ unite#smart_map('l', unite#do_action('default'))

    let unite = unite#get_current_unite()
    if unite.buffer_name =~# '^search'
      nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    else
      nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    endif

    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
            \ empty(unite#mappings#get_current_filters()) ?
            \ ['sorter_reverse'] : [])

    " Runs "split" action by <C-s>.
    imap <silent><buffer><expr> <C-s>     unite#do_action('split')
  endfunction
  " start with insert mode (can start narrow result in no time)
  let g:unite_enable_start_insert=1
  " window
  "let g:unite_enable_split_vertically=1
  let g:unite_split_rule="botright" " default topleft
  let g:unite_winheight=10          " default 20
  let g:unite_winwidth=60           " default 90

  " Unite prefix
  nnoremap [unite] <Nop>
  nmap <Leader>u [unite]
  nmap <Space> [unite]

  " show buffer
  nnoremap <silent> [unite]b :Unite buffer<CR>
  " show files/directories with full path
  nnoremap <silent> [unite]f :Unite -buffer-name=files file<CR>
  " show frecursive file search
  "nnoremap <silent> [unite]f :<C-u>Unite file_rec/async:!<CR>
  " show register
  nnoremap <silent> [unite]r :Unite -buffer-name=register register<CR>
  " show opened file history including current buffers
  "nnoremap <silent> [unite]m :UniteWithBufferDir -buffer-name=files buffer file_mru<CR>
  nnoremap <silent> [unite]m :Unite file_mru<CR>
  " show lines of current file
  nnoremap <silent> [unite]l :Unite line<CR>
  " search (like ack.vim/ag.vim)
  nnoremap <silent> [unite]/ :Unite grep:.<CR>
  " Yank (like yankring/yankstack)
  let g:unite_source_history_yank_enable = 1
  nnoremap <silent> [unite]y :Unite history/yank<CR>

  " sources outside of unite
  nnoremap <silent> [unite]M :Unite mark<CR>
  nnoremap <silent> [unite]c :Unite history/command<CR>
  nnoremap <silent> [unite]s :Unite history/search<CR>
  nnoremap <silent> [unite]F :Unite fold<CR>
  nnoremap <silent> [unite]L :Unite locate<CR>
  nnoremap <silent> [unite]C :Unite colorscheme<CR>
endif
" }}} Unite

" operator {{{
nnoremap [oper] <Nop>
nmap <Leader>o [oper]
if s:neobundle_enable && ! empty(neobundle#get("vim-operator-sort"))
  map [oper]s <Plug>(operator-sort)
endif
if s:neobundle_enable && ! empty(neobundle#get("operator-reverse.vim"))
  map [oper]r  <Plug>(operator-reverse-text)
endif
"}}}

" vim-smartinput {{{
if s:neobundle_enable && ! empty(neobundle#get("vim-smartinput"))
  " Put/Remove space at first in bracket
  call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
  call smartinput#define_rule({
    \'at'    : '(\%#)',
    \'char'  : '<Space>',
    \'input' : '<Space><Space><Left>',
    \})
  call smartinput#define_rule({
    \'at'    : '( \%# )',
    \'char'  : '<BS>',
    \'input' : '<Del><BS>',
    \})

  " Add ; for c++ class/struct/enum
  call smartinput#define_rule({
    \'at'       : '\%(\<struct\>\|\<class\>\|\<enum\>\)\s*\w\+.*\%#',
    \'char'     : '{',
    \'input'    : '{};<Left><Left>',
    \'filetype' : ['cpp'],
    \})
endif
" }}} vim-smartinput

" vim-smartword {{{
if s:neobundle_enable && ! empty(neobundle#get("vim-smartword"))
  " Use W/B/E/gE, such w is not useful to map here
  " especially for text object treatment, such 'cw'.
  map W  <Plug>(smartword-w)
  map B  <Plug>(smartword-b)
  map E  <Plug>(smartword-e)
  map gE  <Plug>(smartword-ge)
  " original keys ('\' is not a <leader> for now)
  noremap <Subleader>W  W
  noremap <subleader>B  B
  noremap <subleader>E  E
  noremap <subleader>gE  gE
endif
" }}} vim-smartword

" surround.vim/vim-surround {{{
if s:neobundle_enable && ! empty(neobundle#get("surround.vim"))
  " Numbers for characters can be found by :ascii on each character
  let g:surround_96 = "`\r`" " use `

  if ! empty(neobundle#get("vim-surround"))
    let g:surround_old_mappings = 1
  endif

  vmap { S{
  vmap } S}
  vmap [ S[
  vmap ] S]
  vmap ( S(
  vmap ) S)
  vmap < S<
  vmap > S>
  vmap " S"
  vmap ' S'
  vmap ` S`
endif
" }}} surround.vim

" yank share with wviminfo/rviminfo {{{
"
" yankshare prefix
noremap [yshare] <Nop>
map s [yshare]

let g:yankshare_file = expand("~/.vim/yankshare.txt")
if !exists("g:yankshare_file")
  let g:yankshare_file = "/tmp/yankshare.txt"
endif


function! YSStore() range
  call writefile([getreg("s")], g:yankshare_file, "b")
endfunction

function! YSLoad() range
  call setreg("s", readfile(g:yankshare_file, "b")[0])
endfunction

nnoremap <silent> [yshare]y  "syy:call YSStore()<CR>
nnoremap <silent> [yshare]yy "syy:call YSStore()<CR>
nnoremap <silent> [yshare]Y  "sY:call YSStore()<CR>
nnoremap <silent> [yshare]y$ "sy$:call YSStore()<CR>
nnoremap <silent> [yshare]y0 "sy0:call YSStore()<CR>
nnoremap <silent> [yshare]yw "syw:call YSStore()<CR>
nnoremap <silent> [yshare]cc "scc<ESC>:call YSStore()<CR>i
nnoremap <silent> [yshare]C  "sC<ESC>:call YSStore()<CR>i
nnoremap <silent> [yshare]c$ "sc$<ESC>:call YSStore()<CR>i
nnoremap <silent> [yshare]c0 "sc0<ESC>:call YSStore()<CR>i
nnoremap <silent> [yshare]cw "scw<ESC>:call YSStore()<CR>i
nnoremap <silent> [yshare]dd "sdd:call YSStore()<CR>
nnoremap <silent> [yshare]D  "sD:call YSStore()<CR>
nnoremap <silent> [yshare]d$ "sd$:call YSStore()<CR>
nnoremap <silent> [yshare]d0 "sd0:call YSStore()<CR>
nnoremap <silent> [yshare]dw "sdw:call YSStore()<CR>

vnoremap <silent> [yshare]y "sy:call YSStore()<CR>
vnoremap <silent> [yshare]c "sc<ESC>:call YSStore()<CR>i
vnoremap <silent> [yshare]d "sd:call YSStore()<CR>

nnoremap <silent> [yshare]p :call YSLoad()<CR>"sp
nnoremap <silent> [yshare]P :call YSLoad()<CR>"sP
nnoremap <silent> [yshare]gp :call YSLoad()<CR>"sgp
nnoremap <silent> [yshare]gP :call YSLoad()<CR>"sgP
" }}} yankshare

" savevers {{{
if s:neobundle_enable && ! empty(neobundle#get("savevers.vim"))
  set patchmode=.clean
  set backup
  let savevers_types = "*"
  let savevers_dirs = &backupdir
  let versdiff_no_resize=1
  nmap <silent> <F5> :VersDiff -<cr>
  nmap <silent> <F6> :VersDiff +<cr>
  nmap <silent> <F8> :VersDiff -c<cr>
endif
" }}}

" status line {{{
set laststatus=2 " always show
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P
" }}} status line

" neocomplcache {{{
if s:neobundle_enable && ! empty(neobundle#get("neocomplcache"))
  let g:acp_enableAtStartup = 1
  let g:neocomplcache_enable_startup = 1
  let g:neocomplcache_enable_smart_case = 1
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
  let g:neocomplcache_text_mode_filetypes =
        \ {'text': 1, 'plaintex':1, 'javascript': 1,
        \  'mkd': 1, 'perl': 1, 'html': 1}
endif
" }}}

" neocomplete {{{
if s:neobundle_enable && ! empty(neobundle#get("neocomplete.vim"))
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#max_list = 20
  "let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#min_keyword_length = 3
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#disable_auto_complete = 0
  let g:neocomplete#enable_auto_select = 0
  let g:neocomplete#lock_buffer_name_pattern = ''
  let g:neocomplete#text_mode_filetypes =
        \ {'hybrid': 1, 'text':1, 'help': 1, 'gitcommit': 1, 'gitrebase':1,
        \  'vcs-commit': 1, 'markdown':1, 'textile':1, 'creole':1, 'org':1,
        \  'rdoc':1, 'mediawiki':1, 'rst':1, 'asciidoc':1, 'prod':1,
        \  'plaintex':1, 'javascript': 1, 'mkd': 1, 'perl': 1, 'html': 1,
        \  'vim':1, 'sh':1 }
  "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><Tab> pumvisible() ? "\<C-n>" : neocomplete#start_manual_complete()
  inoremap <expr><A-y>  neocomplete#close_popup()
  inoremap <expr><A-e>  neocomplete#cancel_popup()
  inoremap <expr><A-l>  neocomplete#complete_common_string()
  inoremap <expr><A-u>  neocomplete#undo_completion()
endif
" }}}

" neosnippet {{{
if s:neobundle_enable && ! empty(neobundle#get("neosnippet"))
  imap <silent><C-k> <Plug>(neosnippet_expand_or_jump)
  inoremap <silent><C-U> <ESC>:<C-U>Unite snippet<CR>
  "nnoremap <silent><Space>e :<C-U>NeoSnippetEdit -split<CR>
  smap <silent><C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <silent>o <Plug>(neosnippet_register_oneshot_snippet)
  "imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
  "smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
endif
" }}}

" matchpair, matchit {{{
"set matchpairs = (:),{:},[:]
set matchpairs+=<:>
source $VIMRUNTIME/macros/matchit.vim
" matchpairs is necessary...?
"let b:match_words = &matchpairs . ',<:>,<div.*>:</div>,if:fi'
let b:match_words = &matchpairs . ',<:>,<div.*>:</div>'
let b:match_ignorecase = 1
" }}} matchpair, matchit

" paste at normal mode{{{

" if not well work... (though it seems working)
" need more understanding of vim/screen pasting...
" can use :a! for temporally paste mode
" or :set paste ,....., :set nopaste
" or set noautoindent, ...., : set autoindent

" it seems working in Mac, but not in Windows (putty+XWin)

if &term =~ "screen" || &term =~ "xterm"
  if &term =~ "screen"
    let &t_SI = &t_SI . "\eP\e[?2004h\e\\"
    let &t_EI = "\eP\e[?2004l\e\\" . &t_EI
    let &pastetoggle = "\e[201~"
  else
    let &t_SI .= &t_SI . "\e[?2004h"
    let &t_EI .= "\e[?2004l" . &t_EI
    let &pastetoggle = "\e[201~"
  endif
  function! XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction
  imap <special> <expr> <Esc>[200~ XTermPasteBegin(""'
endif

" }}} paste

" vim-easymotion{{{
if s:neobundle_enable && ! empty(neobundle#get("vim-easymotion"))
  let g:EasyMotion_keys="hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB"
  "let g:EasyMotion_keys="ifjklasdweuocvbnm"
  let g:EasyMotion_do_mapping=1
  let g:EasyMotion_grouping=1
  hi EasyMotionTarget ctermbg=none ctermfg=red
  hi EasyMotionShade  ctermbg=none ctermfg=blue
  " easymotion prefix
  nnoremap [em] <Nop>
  nmap <Leader>m [em]
  let g:EasyMotion_leader_key="[em]"
endif
" }}} vim-easymotion

" jedi-vim{{{
if s:neobundle_enable && ! empty(neobundle#get("jedi-vim"))
  let g:jedi#auto_initialization = 1
  "let g:jedi#goto_assignments_command = "<Leader>g"
  "let g:jedi#goto_definition_command = "<Leader>d"
  let g:jedi#goto_assignments_command = ""
  let g:jedi#goto_definition_command = ""
  let g:jedi#documentation_command = "K"
  let g:jedi#completions_command = "<C-Space>"
  let g:jedi#popup_select_first = 1
  let g:jedi#popup_on_dot = 0
  autocmd FileType python setlocal omnifunc=jedi#complete
  let g:jedi#auto_vim_configuration = 1
  "let g:jedi#auto_vim_configuration = 0
  "if ! empty(neobundle#get("neocomplete.vim"))
  "  if !exists('g:neocomplete#force_omni_input_patterns')
  "    let g:neocomplete#force_omni_input_patterns = {}
  "  endif
  "  let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
  "endif
endif
" }}} jedi-vim

" vim-indent-guides{{{
if s:neobundle_enable && ! empty(neobundle#get("vim-indent-guides"))
  let g:indent_guides_enable_on_vim_startup = 1
  "let g:indent_guides_guide_size =  1
  let g:indent_guides_start_level = 1
  let g:indent_guides_auto_colors = 0

  "autocmd MyAutoGroup VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=lightgray
  "autocmd MyAutoGroup VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgray
  autocmd MyAutoGroup VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
  autocmd MyAutoGroup VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
endif
"}}} vim-indent-guides

" vim-submode{{{
if s:neobundle_enable && ! empty(neobundle#get("vim-submode"))
  call submode#enter_with("winsize", "n", "", "<C-w>>", "<C-w>>")
  call submode#enter_with("winsize", "n", "", "<C-w><", "<C-w><")
  call submode#enter_with("winsize", "n", "", "<C-w>+", "<C-w>+")
  call submode#enter_with("winsize", "n", "", "<C-w>-", "<C-w>-")
  call submode#enter_with("winsize", "n", "", "<C-w>e", "<C-w>><C-w><")
  call submode#enter_with("winsize", "n", "", "<C-w><C-e>", "<C-w>><C-w><")
  call submode#map("winsize", "n", "", ">", "<C-w>>")
  call submode#map("winsize", "n", "", "<", "<C-w><")
  call submode#map("winsize", "n", "", "+", "<C-w>-")
  call submode#map("winsize", "n", "", "-", "<C-w>+")
  call submode#map("winsize", "n", "", "l", "<C-w>>")
  call submode#map("winsize", "n", "", "h", "<C-w><")
  call submode#map("winsize", "n", "", "j", "<C-w>-")
  call submode#map("winsize", "n", "", "k", "<C-w>+")
  call submode#map("winsize", "n", "", "=", "<C-w>=")
endif
"}}} vim-submode

" vim-operator-replace{{{
if s:neobundle_enable && ! empty(neobundle#get("vim-operator-replace"))
  map _  "0<Plug>(operator-replace)
endif
"}}} vim-operator-replace

" open-browser{{{
if s:neobundle_enable && ! empty(neobundle#get("open-browser.vim"))
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)
endif
"}}} open-browser

" LanguageTool{{{
if s:neobundle_enable && ! empty(neobundle#get("LanguageTool"))
  let g:languagetool_jar="$HOME/.languagetool/LanguageTool-2.1/languagetool-commandline.jar"
endif
"}}} LanguageTool

" ExciteTranslate{{{
if s:neobundle_enable && ! empty(neobundle#get("excitetranslate-vim"))
  xnoremap <Leader>x :ExciteTranslate<CR>
endif
"}}} LanguageTool

" vim-anzu{{{
if s:neobundle_enable && ! empty(neobundle#get("vim-anzu"))
  nmap n <Plug>(anzu-n-with-echo)
  nmap N <Plug>(anzu-N-with-echo)
  nmap * <Plug>(anzu-star-with-echo)
  nmap # <Plug>(anzu-sharp-with-echo)
  let g:airline#extensions#anzu#enabled=0
endif
"}}} vim-anzu

" syntastic{{{
if s:neobundle_enable && ! empty(neobundle#get("syntastic"))
  let g:syntastic_enable_signs=1
  let g:syntastic_auto_loc_list=2
endif
"}}} syntastic

" signify{{{
if s:neobundle_enable && ! empty(neobundle#get("vim-signify"))
  let g:signify_disable_by_default = 1
  let g:signify_cursorhold_normal = 1
  let g:signify_cursorhold_insert = 1
  nmap <Leader>gj <Plug>(signify-next-jump)
  nmap <Leader>gk <Plug>(signify-prev-jump)
  nnoremap <Leader>gt :SignifyToggle<CR>
  nnoremap <Leader>gh :SignifyToggleHighlight<CR>
endif
"}}} signify

" applescript{{{
if s:neobundle_enable && ! empty(neobundle#get("applescript.vim"))
  autocmd MyAutoGroup bufnewfile,bufread *.scpt,*.applescript :setl filetype=applescript
"autocmd MyAutoGroup FileType applescript :inoremap <buffer> <S-CR>  ¬<CR>
endif
"}}} applescript

" lightline.vim {{{
if s:neobundle_enable && ! empty(neobundle#get("lightline.vim"))
  let g:lightline = {
    \"colorscheme": "jellybeans",
    \"active": {
      \"left": [["test", "mode", "filename"], ["fugitive"]],
      \"right": [["lineinfo"], ["fileinfo"]]},
    \"component_visible_condition": {
      \"fugitive": '(exists("*fugitive#head") && ""!=fugitive#head())'},
    \'component_function': {
      \'test': 'LLFunc',
      \'mode': 'LLMode',
      \'filename': 'LLFileName',
      \'fugitive': 'LLFugitive',
      \'fileinfo': 'LLFileInfo',
      \'lineinfo': 'LLLineInfo',
      \},
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \}
  let g:lightline.inactive = g:lightline.active

  function! LLMode()
    let ps = ''
    if &paste
      let ps = " P"
    endif
    return lightline#mode() . ps
  endfunction

  function! LLFileName()
    let fn = expand("%:t")
    let ro = &ft !~? 'help' && &readonly ? " RO" : ""
    let mo = &modifiable && &modified ? " +" : ""
    return fn . ro . mo
  endfunction

  function! LLFugitive()
    let fu = exists('*fugitive#head') ? fugitive#head() : ''
    return winwidth('.') >=
          \  strlen(LLMode()) + 2
          \+ strlen(LLFileName()) + 2
          \+ strlen(fu) + 2
          \+ strlen(LLLineInfo()) + 2
          \? fu : ''
  endfunction

  function! LLFileInfo()
    let ff = &fileformat
    let fe = (strlen(&fenc) ? &fenc : &enc)
    let ft = (strlen(&filetype) ? &filetype : 'no')
    let fi = ff . " " . fe . " " . ft
    return winwidth('.') >=
          \  strlen(LLMode()) + 2
          \+ strlen(LLFileName()) + 2
          \+ strlen(LLFugitive())
          \+ ((exists("*fugitive#head") && ""!=fugitive#head()) ? 2 : 0)
          \+ strlen(fi) + 2
          \+ strlen(LLLineInfo()) + 2
          \? fi : ''
  endfunction

  function! LLLineInfo()
    let cl = line(".")
    let ll = line("$")
    let cc = col(".")
    let li = printf("%4d/%d:%3d", cl, ll, cc)
    return winwidth('.') >=
          \  strlen(LLFileName()) + 2
          \+ strlen(li) + 2
          \? li : ''
  endfunction
endif
"}}} lightline.vim

" vim-ref {{{
if s:neobundle_enable && ! empty(neobundle#get("vim-ref"))
  " Set webdict sources
  let g:ref_source_webdict_sites = {
  \   "je": {
  \     "url": "http://dictionary.infoseek.ne.jp/jeword/%s",
  \   },
  \   "ej": {
  \     "url": "http://dictionary.infoseek.ne.jp/ejword/%s",
  \   },
  \   "wiki": {
  \     "url": "http://ja.wikipedia.org/wiki/%s",
  \   },
  \ }

  " Set default
  let g:ref_source_webdict_sites.default = "ej"

  " Filter
  function! g:ref_source_webdict_sites.je.filter(output)
    return join(split(a:output, "\n")[15 :], "\n")
  endfunction
  function! g:ref_source_webdict_sites.ej.filter(output)
    return join(split(a:output, "\n")[15 :], "\n")
  endfunction
  function! g:ref_source_webdict_sites.wiki.filter(output)
    return join(split(a:output, "\n")[17 :], "\n")
  endfunction

  " vim-ref prefix
  nnoremap [ref] <Nop>
  vnoremap [ref] <Nop>
  nmap <Leader>r [ref]
  vmap <Leader>r [ref]
  nnoremap [ref]j :Ref webdict je<Space>
  nnoremap [ref]e :Ref webdict ej<Space>
  nnoremap [ref]w :Ref webdict wiki<Space>
  nnoremap [ref]m :Ref man<Space>
  vnoremap [ref]j :<C-u>Ref webdict je <C-R><C-w><CR>
  vnoremap [ref]e :<C-u>Ref webdict ej <C-R><C-w><CR>
  vnoremap [ref]w :<C-u>Ref webdict wiki <C-R><C-w><CR>
endif
"}}}

" SrcExpl  {{{
if s:neobundle_enable && ! empty(neobundle#get("SrcExpl"))
 let g:SrcExpl_RefreshTime = 1
 let g:SrcExpl_UpdateTags = 0
 nnoremap <Leader>e :SrcExplToggle<CR>
endif
"}}}

" tagbar {{{
if s:neobundle_enable && ! empty(neobundle#get("tagbar"))
  nnoremap <silent> <leader>t :TagbarToggle<CR>
endif
"}}} tagbar

" tag {{{
if has("path_extra")
  set tags+=tags;
endif
"}}} tag

" cscope {{{
if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
  set cscopequickfix=s-,c-,d-,i-,t-,e-
endif
" }}} cscope

" gist-vim {{{
if s:neobundle_enable && ! empty(neobundle#get("gist-vim"))
  let g:gist_detect_filetype = 1
  let g:gist_open_browser_after_post = 1
  " Disable default Gist command
  cnoremap <silent> Gist<CR> echo 'use Gist -P to make a public gist'<CR>
endif
"}}} gist-vim

" local settings {{{
if filereadable(expand("~/.vimrc.local"))
  execute "source" expand("~/.vimrc.local")
endif
" }}}

" neobundle on_source {{{
if !has("vim_starting")
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook("on_source")
endif
" }}}

" vim: foldmethod=marker
" vim: foldmarker={{{,}}}
" vim: foldlevel=0
