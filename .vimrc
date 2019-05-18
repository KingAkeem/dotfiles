call plug#begin('~/.vim/bundle')
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/Valloric/YouCompleteMe.git'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'fatih/vim-go'
Plug 'skywind3000/asyncrun.vim'
call plug#end()

" Tab options
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Better CLI completion
set wildmenu
" Sets search highlighting
set hlsearch
" Use case insensitive serach, except when using captial letters
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

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue"
"set cmdheight=2


set number
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
:augroup END

ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O
ino {,<CR> {<CR>},<ESC>O

set background=light
set termguicolors


autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

" Allows toggling of NerdTree using F2
nmap <F2> :NERDTreeToggle<CR>

syntax on
:set bg=dark
" YouCompleteMe Setup
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_enable_diagnostic_highlight = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_global_ycm_extra_conf='~/.vimpkg/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

colorscheme monokai_pro
