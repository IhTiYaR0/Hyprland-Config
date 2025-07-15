"PlugInstall====================================
" Плагины (через vim-plug)
" ========================================
call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'numToStr/Comment.nvim'

" IDE и автодополнение
Plug 'neoclide/coc.nvim', {'branch': 'release'}       " Автодополнение на LSP
Plug 'dense-analysis/ale'                             " Линтер и автофикс

Plug 'windwp/nvim-autopairs'

" Подсветка и синтаксис
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-python/python-syntax'                       " Улучшенная подсветка Python

" Файловый менеджер и поиск
Plug 'preservim/nerdtree'                             " Дерево файлов
Plug 'junegunn/fzf'                                   " Fuzzy Finder
Plug 'junegunn/fzf.vim'

" Темы
Plug 'folke/tokyonight.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Статусная строка
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'                    " Иконки (для lualine/NERDTree)

" Боковая панель с символами (структура кода)
Plug 'simrat39/symbols-outline.nvim'

" Smooth scrolling
Plug 'karb94/neoscroll.nvim'

" Smear‑эффект курсора
Plug 'sphamba/smear-cursor.nvim'

call plug#end()

" ========================================
" Общие настройки
" ========================================
syntax on
filetype plugin indent on

" Визуальные
set number                      " Номера строк
set relativenumber             " Относительные номера
set cursorline                 " Подсветка текущей строки
set background=dark            " Тёмная тема

" Отступы
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Копипаст буфер ОС
set clipboard=unnamedplus

" Цветовая схема (можно менять на 'tokyonight', 'catppuccin' и т.п.)
colorscheme onedark

" ========================================
" COC.nvim (автодополнение)
" ========================================
let g:coc_global_extensions = ['coc-pyright']

" Перемещение по определению
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Автозавершение через Tab
inoremap <expr> <Tab>     pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab>   pumvisible() ? "\<C-p>" : "\<S-Tab>"

 " Альтернатива — Enter для подтверждения
" inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

" ========================================
" ALE (линтер и автоформатирование)
" ========================================

let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'python': ['flake8', 'mypy']
\}

let g:ale_fixers = {
\   'python': ['autopep8']
\}

"========================================
" FZF (поиск файлов)
" ========================================
nnoremap <silent> <C-p> :Files<CR>
" nnoremap <silent> <C-b> :Buffers<CR>

" ========================================
" NERDTree (файловый менеджер)
" ========================================
map <C-n> :NERDTreeToggle<CR>

" ========================================
" Treesitter (расширенная подсветка)
" ========================================
lua << EOF
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
}
EOF

" ========================================
" Lualine (статусная строка)
" ========================================
lua << EOF
require('lualine').setup {
  options = {
    theme = 'nord',          -- Смените на 'catppuccin', 'tokyonight', 'nord', и т.д.
    section_separators = '',
    component_separators = '',
  }
}
EOF

" ========================================
" Symbols Outline (структура кода сбоку)
" ========================================
lua << EOF
require('symbols-outline').setup()
EOF

nnoremap <F8> :SymbolsOutline<CR>

let g:coc_global_extensions = [
    \ 'coc-pyright',     
    \ 'coc-html',          
    \ 'coc-css',        
    \ 'coc-json',          
    \ 'coc-tsserver',      
    \ 'coc-yaml',          
    \ 'coc-emmet',         
    \ ]


lua << EOF
require('Comment').setup()
EOF


lua << EOF
require('nvim-treesitter.configs').setup {
  highlight = { enable = true },
  ensure_installed = { "python", "html", "css", "javascript", "lua", "bash" },
}
EOF


nnoremap <silent> <C-/> :silent! lua require('Comment.api').toggle.linewise.current()<CR>
vnoremap <silent> <C-/> :silent! lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>

" Использовать <CR> (Enter) для выбора подсказки coc.nvim

" Использовать <CR> (Enter) для выбора подсказки coc.nvim
" inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

lua << EOF
require("nvim-autopairs").setup({
  check_ts = true,
  map_cr = true,
  map_bs = true,
})
EOF

inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

" Запускаем Lua-код после загрузки плагинов
lua << EOF
-- neoscroll
require('neoscroll').setup({
  easing = 'sine',
  duration_multiplier = 0.3,
})
-- smear cursor
require('smear_cursor').setup({
  smear_between_buffers = true,
  smear_insert_mode = true,
})
EOF

