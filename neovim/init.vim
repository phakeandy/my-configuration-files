let mapleader = " "

" == Tab ==
set tabstop=4     " 设定 Tab 符号占用4个空格的宽度
set shiftwidth=4   " 设置自动缩进（包括<<, >>等操作）的空格数
set expandtab      " 将 Tab 键输入转化为4个空格
set softtabstop=4  " 在智能缩进模式下，Backspace 操作会删除相当于4个空格的字符
set ai "Auto indent
set si "Smart indent

" == basic settings ==
set ignorecase
set mouse=a
set cursorline " highlight the line where the cursor is located
set nu
set termguicolors " real color
syntax on 
set smartcase



" === KEY MAP === "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
vnoremap jk <esc>
vnoremap kj <esc>
tnoremap jk <C-\><C-n>
nnoremap <leader>b :buffers<CR>:b
nnoremap <Leader>t :term ++close<cr>

"emacs 风格快捷键
inoremap <C-e> <C-o>A

" === Windows 打开powershell === 
"cmd -> pwsh
" nnoremap <leader>t :ter<CR>ipwsh<CR>clear<CR> 


if &filetype == 'markdown' " markdown 预览
    nnoremap <F5> :CocCommand markdown-preview-enhanced.openPreview<CR>
endif



" vim-plug 
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

call plug#end()

" theme
colorscheme gruvbox 
set background=dark

" FZF 
nnoremap <leader>f :FZF<CR>


" === coc.nvim ===
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" 补全菜单背景透明
set pumblend=15

" neovide
if exists("g:neovide")
    " Put anything you want to happen only in Neovide here
    let g:neovide_transparency = 0.9
    let g:neovide_remember_window_size = v:true
endif

" gvim 
if has("gui_running")
    " 设置gui字体
    set guifont=Cascadia\ Code:h12
    " 模拟终端复制
    "nnoremap <C-a> ggVG
    nnoremap <C-S-v> "+p
    inoremap <C-S-v> <C-r>+
    inoremap <C-S-v> <C-o>"+p
    vnoremap <C-S-c> "+y
    cnoremap <C-S-v> <C-r>+
    "winpos 100 100 " 设置初始界面位置
    set lines=30 columns=100 " 设置初始界面大小
endif

autocmd InsertLeave * :!D:\\xunleiDownload\\im-select-master\\win\\out\\x64\\im-select.exe 1033
