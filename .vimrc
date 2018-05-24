execute pathogen#infect()
set nocompatible "Required
filetype off "Required

" Attempts to determine file type based on name and posibly content.
" Is sometimes needed for plugins that are filetype specific.
filetype indent plugin on

"Enable NERDTREE
nmap <F2> :NERDTreeToggle<CR>

"Enable Syntax highlighting
syntax on

"Allowing color schems and changing theme
if &term == "screen"
        set t_Co=256
endif
colorscheme zenburn

" Adding Ag to vim through Ack.vim
let g:ackprg = 'ag --vimgrep'

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
"set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
"set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Relative numbers
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
:augroup END

" Special character completer

""ino " ""<left>
""'ino ' ''<left>
""ino ( ()<left>
""ino [ []<left>
""ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O
ino {,<CR> {<CR>},<ESC>O

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
" React uses 2, and Ext uses 4
"set shiftwidth=2
"set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2

" For Ext JS
autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4

" For React JS
"autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" For golang
autocmd FileType golang setlocal tabstop=8 shiftwidth=8 softtabstop=8

" For json
autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
" map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
" nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------

" **************************NEEDED FOR REACT**********************
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_args = ['--fix']
"set autoread
"au VimEnter *.js au BufWritePost *.js checktime
"autocmd BufWritePost *.js :checktime
" **************************NEEDED FOR REACT**********************


" *****************************NEEDED FOR EXTJS********************************

"Call jsbeautify on javascript/css/html files on save

autocmd BufWritePre *.js :call JsBeautify()
autocmd BufWritePre *.css :call CSSBeautify()
autocmd BufWritePre *.html :call HtmlBeautify()
"autocmd BufWritePre *.json :call JsonBeautify()

let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']

" *****************************NEEDED FOR EXTJS********************************

" Golint stuff
" Annoying for Ares since they don't have go formatted correctly
"function ClearQuickfixList()
"    call setqflist([])
"endfunction

let g:go_disable_autoinstall = 0
set rtp+=/home/vagrant/gocode/src/github.com/golang/lint/misc/vim
let g:go_metalinter_enabled = [ 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = [ 'golint', 'errcheck']
"autocmd BufWritePost,FileWritePost *.go call ClearQuickfixList() | execute 'GoLint' | cwindow

let g:go_highlight_function = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

imap jk <esc>
