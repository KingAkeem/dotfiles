
set nocompatible
nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
" Remapping Control + W then Control + direction keys to just
" Control + direction keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Automatically complete pairs
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

filetype on 

" Set the runtime path to include Vundle and intialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

"Autocompletion
Plugin 'valloric/youcompleteme'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

"Nerdtree
Plugin 'scrooloose/nerdtree'

"Syntastic
Plugin 'scrooloose/syntastic'

"Airline
Plugin 'bling/vim-airline'

"Python-Mode
Plugin 'klen/python-mode'


"Configurations
set tabstop=4
set shiftwidth=4
set expandtab
set number

" All of Plugins added
call vundle#end()
filetype plugin indent on
syntax on
