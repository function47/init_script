"Defulat Settings
set nu
syntax on
inoremap jk <Esc>

set incsearch
set shiftwidth=4
set tabstop=4
set expandtab
setlocal noswapfile
set noerrorbells
set novisualbell

" Vim-plug Setup
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
    Plug 'preservim/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'
    Plug 'sainnhe/everforest'
    Plug 'edkolev/tmuxline.vim'
    Plug 'nathanaelkane/vim-indent-guides'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" NerdTree keymap
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Hot key for moving cursor
map <C-a> <ESC>^
imap <C-a> <ESC>I
map <C-e> <ESC>$
imap <C-e> <ESC>A
imap f <ESC><Space>Wi
inoremap b <Esc>Bi
inoremap d <ESC>cW

" Hot key for complete bracket
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='dark'
let g:airline_powerline_fonts=1
let hostname=system('hostname -s | tr -d "\n"')
let g:airline_section_b = '%{hostname}'

" sainnhe/everforest
if has('termguicolors')
  set termguicolors
endif
" For dark version.
set background=dark
" For light version.
" set background=light
" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'hard'
let g:everforest_enable_italic = 0
" For better performance
let g:everforest_better_performance = 1
colorscheme everforest

" Tmuxline allow tmux share same theme with vim
let g:tmuxline_preset = {
      \'a'    : 'TMUX: #S',
      \'b'    : '#W',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '%R',
      \'z'    : '#(whoami)'}

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
          set termguicolors
      endif"]""]"'')
