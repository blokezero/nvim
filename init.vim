" plugins

call plug#begin()
" Theme
Plug 'jacoborus/tender.vim'
Plug 'skielbasa/vim-material-monokai'
Plug 'cocopon/iceberg.vim'
Plug 'dracula/vim'

" Vim helpers
Plug 'tpope/vim-eunuch'
" Plug 'farmergreg/vim-lastplace'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'ntpeters/vim-better-whitespace'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" Snippets
Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'sirver/UltiSnips'

" Linters
Plug 'w0rp/ale'

" UI
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" File
Plug 'justinmk/vim-dirvish'
Plug 'pbrisbin/vim-mkdir'
Plug 'kristijanhusak/vim-dirvish-git'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Language
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}

Plug 'LucHermitte/lh-vim-lib' " Helper to open new file in split from COC gd

" Helpers
" Plug 'firegoby/html_entities_helper.vim'

call plug#end()

" VIM SETTINGS
set mouse=a
set noswapfile

" Key mapping
" w!! will sudo save.
cmap w!! w !SUDO_ASKPASS=/usr/local/bin/ssh-askpass sudo -A tee % > /dev/null

" ENCODING
set encoding=utf-8
scriptencoding utf-8
set nocompatible

" Theme
colorscheme elflord
highlight clear SignColumn

" TOGGLE INVISIBLE CHARACTERS
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮,nbsp:·
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪
nmap <leader>I :set list!<cr>

" Copy & paste to system clipboard with <Space>p and <Space>y:

set nopaste
vmap <Leader>y "+y
vmap <Leader>D "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Replace selected text with register on 'r' without copying into register.
vmap r "_dP"

" SPLITS AND WINDOWS
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" Use CTRL + MV to switch splits.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" SEARCH
set hlsearch
set incsearch
set ignorecase
set smartcase

" // Will copy selected text and search for it.
vnoremap // y/<C-R>"<CR>"

" :C clears search highlighting
:command! C let @/=""


" Don't loose visual selection after indenting with arrow keys.
vnoremap > >gv
vnoremap < <gv

" Indent guide
let g:indentLine_char = '│'

" WIDTH
set textwidth=80
set colorcolumn=+1

" Words Wrap settings
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0

" LINE NUMBERS
set number
set numberwidth=5

" VARIOUS.
set backspace=2   " Backspace, this is the same as :set
set ruler         " Show the cursor position.
set scrolloff=5   " Show 5 lines above/below the cursor when
set showcmd       " Shows the command in the last line of the screen.
set autoread      " Read files when they've been changed outside of Vim.
set showtabline=2 " Always show tabline.
set hidden        " Hide buffers rather than prompt to save them.

" Bells and whistles.
set novisualbell

set history=300 " Number of command lines stored in the history

set title " Set the title in the console.

set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Space setting
set shiftwidth=2

" Appearance
set hlsearch
set incsearch

" keymaps

let g:mapleader = "\<space>"



" plugin settings

" auto-pairs

let g:AutoPairsMapCh = 0
let g:AutoPairsMapCR = 0


"" fzf

nnoremap ; :Buffers<cr>
nnoremap <leader>c :History:<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>l :Lines<cr>
nnoremap <leader>m :Maps<cr>
nnoremap <leader>r :Ag<cr>


" highlight Normal      ctermbg=none
" highlight NonText     ctermbg=none
" highlight EndOfBuffer ctermbg=none
" highlight VertSplit   cterm=none ctermfg=240 ctermbg=240

" ----- FZF -----
let g:fzf_layout = { 'down': '~40%' }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }


" Use ripgrep instead of ag:
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('up:60%', '?'),
      \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
      \ 'prefix': '^.*$',
      \ 'source': 'rg -n ^ --color always',
      \ 'options': '--ansi --delimiter : --nth 3..',
      \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Add a ripgrep only search
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" ------ lightline ------
set laststatus=2
set noshowmode
set cmdheight=2

let g:lightline = {
      \ 'colorscheme': 'tender',
      \ 'mode_map': { 'c': 'n' },
      \ 'active': {
      \  'left': [
      \    ['mode','paste'],
      \    ['cocstatus', 'currentfunction', 'fugitive', 'readonly', 'filename', 'modified'],
      \  ]
      \ },
      \ 'component_function': {
      \   'mode': 'LightLineMode',
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \   'fileencoding': 'LightLineFileencoding',
      \   'relativepath': 'MyRelativePath',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }


let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \  'buffers': 'lightline#bufferline#buffers',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \     'buffers': 'tabsel',
      \ }

" Bufferline settings.
" https://github.com/mengelbrecht/lightline-bufferline
let g:lightline.tabline = {'left': [['tabs']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#min_buffer_count = 2
let g:lightline#bufferline#read_only = ''

function! LightLineModified()
  return &filetype =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &filetype !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  "return (fnamemodify(expand("%"), ":~:."))
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&filetype == 'vimfiler' ? vimfiler#get_status_string() :
        \  &filetype == 'unite' ? unite#get_status_string() :
        \  &filetype == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%') ? expand('%') : '[No Name]')
endfunction

function! LightLineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 90 ? lightline#mode() : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyRelativePath()
  return &filetype ==# 'fzf' ? 'fzf' :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

let g:lightline#ale#indicator_warnings = "\uf071\u00A0"
let g:lightline#ale#indicator_errors = "\uf05e\u00A0"
let g:lightline#ale#indicator_ok = "\uf00c"

" ---- Dirvish ----
" File explorer: https://github.com/justinmk/vim-dirvish
let g:loaded_netrwPlugin = 1
nmap - <Plug>(dirvish_up)
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
" Put directories at top.
let g:dirvish_mode = ':sort ,^.*[\/],'

augroup dirvish_config
  autocmd!

  " Map `t` to open in new tab.
  autocmd FileType dirvish
        \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>

  " Map `gr` to reload.
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gr :<C-U>Dirvish %<CR>

  " Map `gh` to hide dot-prefixed files.  Press `R` to "toggle" (reload).
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>
augroup END

" ---- Signify ---
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1
let g:signify_cursorhold_normal = 0
let g:signify_cursorhold_insert = 0

" ---- NEOFORMAT ----
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" ---- PRETTIER ----
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ------- File type specific

" Use xmllint to indent.
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" ----- PHP Intelephense -------
" if executable('intelephense')
"   augroup LspPHPIntelephense
"     au!
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'intelephense',
"         \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
"         \ 'whitelist': ['php'],
"         \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
"         \ 'workspace_config': {
"         \   'intelephense': {
"         \     'files': {
"         \       'maxSize': 1000000,
"         \       'associations': ['*.php', '*.phtml'],
"         \       'exclude': [],
"         \     },
"         \     'completion': {
"         \       'insertUseDeclaration': v:true,
"         \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
"         \       'triggerParameterHints': v:true,
"         \       'maxItems': 100,
"         \     },
"         \     'format': {
"         \       'enable': v:true
"         \     },
"         \   },
"         \ }
"         \})
"   augroup END
" endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" COC activate

" Remap for do codeAction of selected region
" function! s:cocActionsOpenFromSelected(type) abort
"   execute 'CocCommand actions.open ' . a:type
" endfunction
" xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" COC snippet
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" :Prettier to format file
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ----- w0rp/ale linter settings ------
nmap <silent> <leader>j <Plug>(ale_previous_wrap)
nmap <silent> <leader>k <Plug>(ale_next_wrap)

let g:ale_sign_error = '●'
let g:ale_sign_warning = 'w'

" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️'

let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
" let g:ale_lint_delay = 750
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_php_phpcs_standard = 'Drupal'

let g:ale_linters = {'jsx': ['eslint'], 'javascript': ['eslint', 'flow']}
let g:ale_linter_aliases = {'jsx': 'css'}
highlight clear SignColumn
let g:ale_linters = {
      \   'html': ['htmlhint', 'prettier'],
      \}
" Bind F8 to fixing problems with ALE
nmap <F8> <Plug>(ale_fix)
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint'],
      \   'scss': ['prettier', 'stylelint'],
      \   'php': ['phpcbf']
      \}
