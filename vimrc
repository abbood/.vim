syntax enable
set background=dark
set encoding=UTF-8


let g:spacegray_low_contrast = 1


colorscheme spacegray
" colorscheme hybrid_material
"colorscheme sonokai

" https://stackoverflow.com/a/1764336/766570
let mapleader = ","

set termguicolors

set hlsearch
set ignorecase


hi Search cterm=NONE ctermfg=black ctermbg=172

autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType sh setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType php setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType java setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType cucumber setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType swift setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2



"#autocmd FileType php colorscheme spacegray
autocmd FileType php colorscheme gruvbox
autocmd FileType java colorscheme gruvbox
autocmd FileType kotlin colorscheme gruvbox

"set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

"set shiftwidth=2    " Indents will have a width of 4

"set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

set autoindent

set nocompatible              " be iMproved, required
set number
filetype plugin indent on


let g:ale_emit_conflict_warnings = 0

" to quickly remove errors from ts
" https://github.com/w0rp/ale#faq-disable-linters
" let g:ale_linters_explicit = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'php': ['php'],
\}

let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }






" https://github.com/w0rp/ale#faq-disable-linters
" let g:ale_linters_explicit = 1
" In ~/.vim/vimrc, or somewhere similar.

" VUNDLE
" set the runtime path to include Vundle and initialize
"
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'burnettk/vim-angular'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/cSyntaxAfter'
Plugin 'w0ng/vim-hybrid'
Plugin 'majutsushi/tagbar'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/DBGp-Remote-Debugger-Interface'
Plugin 'joonty/vdebug'
Plugin 'tpope/vim-unimpaired'
Plugin 'ajh17/Spacegray.vim'
Plugin 'morhetz/gruvbox'
Plugin 'jnurmine/Zenburn'
Plugin 'ErichDonGubler/vim-sublime-monokai'
Plugin 'vim-scripts/Conque-Shell'
Bundle 'joonty/vim-do'
Plugin 'Rican7/php-doc-modded'
Plugin 'adoy/vim-php-refactoring-toolbox'
Plugin 'dhruvasagar/vim-zoom'
Plugin 'keith/swift.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
" linting
Plugin 'w0rp/ale'
"Plugin 'vim-syntastic/syntastic'
" see https://dev.to/allanmacgregor/vim-is-the-perfect-ide-e80
"Plugin 'vim-syntastic/syntastic'
"Plugin 'Townk/vim-autoclose'
"Plugin 'phpvim/phpcd.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'Shougo/vimproc'
Plugin 'Quramy/tsuquyomi'
Plugin 'joereynolds/gtags-scope'
Plugin 'sainnhe/sonokai'
Plugin 'cohama/agit.vim'
Plugin 'uiiaoo/java-syntax.vim'
Plugin 'esensar/neovim-kotlin'

"Plugin 'jason0x43/vim-js-indent'



" All of your Plugins must be added before the following line
call vundle#end()            " required

set tags=./tags,tags;$HOME
set runtimepath^=~/.vim/bundle/ctrlp.vim

set grepprg=grep\ -nriI\ --exclude=tags\ --exclude-dir=vendor

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  let &grepprg = "ag --nogroup --nocolor --ignore wiki --ignore tags --ignore dist --ignore tests --ignore seeds --ignore migrations -w"

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><ENTER>


" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" above replaced with
" https://vi.stackexchange.com/a/14939/14510
function! Ag(args) abort
  execute "silent! grep!" shellescape(a:args)
  cwindow
  redraw!
endfunction

command -nargs=+ -complete=file Ag call Ag(<q-args>)

" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>


" bind L to grep word under cursor for current file only
nnoremap L :vim <C-R><C-W> %<CR>:cw<CR>
"nnoremap L :vim <C-R><C-W> %<CR>:copen<CR>

" https://stackoverflow.com/a/42218001/766570
nmap <F8> :TagbarToggle<CR>
nmap <F12> :CtrlP<CR>

nmap <F1> :cclose<CR>

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

map <C-j> :FZF<CR>
map <C-f> :Buffers<CR>
map <C-h> :BTags<CR>
map <C-g> :Tags<CR>

" arabic support
"map <C-g> :set rightleft<CR>
"map <C-h> :set norightleft<CR>

" agit show
nnoremap <C-i> :Agit<CR>

noremap <F9> :vertical botright copen 60<cr>
"noremap <F10> :copen 40<cr>
map <C-1> :copen 40<cr>

" to split under vimrc
" https://vi.stackexchange.com/a/14805/14510
:nnoremap \n :split \| :2winc h<CR>

set splitbelow
set splitright

set clipboard=unnamed

" buffers binding
" http://vim.wikia.com/wiki/Easier_buffer_switching
:nnoremap <F5> :buffers<CR>:buffer<Space>

" jump to definition on vertical split
" https://vi.stackexchange.com/a/14821/14510
:nnoremap <c-b> :vert winc ]<CR>
:nnoremap <leader>-j winc ]<CR>


" see https://stackoverflow.com/a/8950400/766570
" " PHP documenter script bound to Control-P
autocmd FileType php inoremap <C-p> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-p> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-p> :call PhpDocRange()<CR>

" vim debugging
" https://ccpalettes.wordpress.com/2013/06/03/remote-debugging-php-with-vim-and-xdebug/
" https://vi.stackexchange.com/questions/14159/how-to-point-xdebug-back-to-vim-on-local-host/14161#14161

let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000

" debugger
"map <C-g> :Breakpoint
:nnoremap <leader>-g :Breakpoint 
map <C-e> :VdebugEval


" to get number of occurences of a string
"https://vi.stackexchange.com/a/15476/14510
nnoremap  S  :%s///gn<LEFT><LEFT><LEFT><LEFT>

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1


let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-m>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

let g:python3_host_prog='/Users/abdullah/.pyenv/shims/python3'


