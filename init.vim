" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"
" ==================== Auto load for first time uses ====================
" auto load my vim-plug
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:nvim_plugins_installation_completed=1
if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
	let g:nvim_plugins_installation_completed=0
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==================== Editor behavior ====================
" set clipboard=unnamedplus
" set relativenumber
let &t_ut=''
set autochdir
set exrc
set secure
set number
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set lazyredraw
set visualbell
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes
"--- learning vimscript
set nocp
filetype plugin on
"---
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ==================== Terminal Behaviors ====================
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>


" ==================== Basic Mappings ====================
let mapleader=" "
noremap ; :
nnoremap Q :q<CR>
nnoremap S :w<CR>
" Open the vimrc file anytime
nnoremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>
nnoremap <LEADER>rv :e .nvimrc<CR>
augroup NVIMRC
    autocmd!
    autocmd BufWritePost *.nvimrc exec ":so %"
augroup END
" Copy to system clipboard
vnoremap Y "+y
" Find pair
noremap ,. %
" Search
noremap <LEADER><CR> :nohlsearch<CR>
" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1
" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g
" Folding
noremap <silent> <LEADER>o za


" ==================== Cursor Movement ====================
noremap <silent> \v v$h
" U/J keys for 5 times u/e (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j
" N key: go to the start of the line
noremap <silent> N 0
" M key: go to the end of the line
noremap <silent> M $
" Faster in-line navigation
noremap W 5w
noremap B 5b
" set h (same as n, cursor left) to 'end of word'
" noremap h e
" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-K> 5<C-y>
noremap <C-J> 5<C-e>


" ==================== Insert Mode Cursor Movement ====================
inoremap <C-a> <ESC>A


" ==================== Command Mode Cursor Movement ====================
cnoremap <C-a> <Home> 
cnoremap <C-e> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>


" ==================== Window management ====================
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
noremap qw <C-w>o
" Disable the default s key
noremap s <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sw :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sx :set splitbelow<CR>:split<CR>
noremap sa :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sd :set splitright<CR>:vsplit<CR>
" Resize splits with arrow keys
noremap <down> :res +5<CR>
noremap <up> :res -5<CR>
noremap <right> :vertical resize-5<CR>
noremap <left> :vertical resize+5<CR>
" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H
" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H
" Press <SPACE> + q to close the window below the current window
noremap <leader>q <C-w>j:q<CR>


" ==================== Tab management ====================
" Create a new tab with tu
noremap tu :tabe<CR>
noremap tU :tab split<CR>
" Move around tabs with tn and ti
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>


" ==================== Markdown Settings ====================
" Snippets
" source $HOME/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ==================== Other useful stuff ====================
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>
" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res -5<CR>:term<CR>
" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>
" Press ` to change case (instead of ~)
noremap ` ~
noremap <C-z> zz
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
" Call figlet
noremap tx :r !figlet 
" find and replace
noremap \s :%s//g<left><left>
" set wrap
noremap <LEADER>sw :set wrap<CR>
" press f10 to show hlgroup
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>

" Compile function
noremap <leader>E :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		:sp
		:res -5
		term gcc % -o %< && time ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


" ==================== Install Plugins with Vim-Plug ====================
call plug#begin('$HOME/.config/nvim/plugged')
" im-select
Plug 'keaising/im-select.nvim'

" GitHub Copilot
Plug 'github/copilot.vim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "Highlight the syntax of many language

" Pretty Dress
" Plug 'dracula/vim', { 'as': 'dracula' } 
Plug 'folke/tokyonight.nvim' 

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' } "Show the color cube of the hex
Plug 'RRethy/vim-illuminate' " Highlight the same word in shadow

" File navigation
Plug 'ibhagwan/fzf-lua'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-rooter'
Plug 'kevinhwang91/rnvimr' "run ranger in nvim
Plug 'theniceboy/joshuto.nvim' " run joshuto in nvim
Plug 'pechorin/any-jump.vim'

" Debugger
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Auto Complete
Plug 'wellle/tmux-complete.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
" Plug 'SirVer/ultisnips'

" Tree
Plug 'mbbill/undotree' " type U to open the undo tree
Plug 'nvim-tree/nvim-tree.lua'

" " Git
"Plug 'mhinz/vim-signify'
Plug 'cohama/agit.vim' "A powerful git log viewer
Plug 'kdheepak/lazygit.nvim' "A lazygit wrapper for neovim
Plug 'lewis6991/gitsigns.nvim' "

" HTML, JSON
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Rust
Plug 'rust-lang/rust.vim'

" CPP
Plug 'rhysd/vim-clang-format'

" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim' "

" Editor Enhancement
Plug 'petertriho/nvim-scrollbar'
Plug 'kevinhwang91/nvim-hlslens' " quick search
Plug 'ggandor/lightspeed.nvim' " quick search with 'f'/'F'/'t'/'T'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi' " multiple cursors
Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line
Plug 'theniceboy/antovim' " gs to switch
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip or just Enter
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
" Plug 'svermeulen/vim-subversive'
Plug 'vim-scripts/argtextobj.vim'
Plug 'rhysd/clever-f.vim'
Plug 'AndrewRadev/splitjoin.vim' "gS/gJ to split/join lines
Plug 'matze/vim-move'
Plug 'lukas-reineke/indent-blankline.nvim'

" For general writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-wordy' " type :Wordy to check the grammar of the text
"Plug 'ron89/thesaurus_query.vim'

" Find & Replace
Plug 'nvim-lua/plenary.nvim' " nvim-spectre dep
Plug 'nvim-pack/nvim-spectre' " brew install gnu-sed

" Documentation
" Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Mini Vim-APP
"Plug 'jceb/vim-orgmode'
"Plug 'mhinz/vim-startify'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" Other visual enhancement
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/terminus'

" Status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'nanozuki/tabby.nvim'

" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'


" Other useful utilities
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite

call plug#end()

set re=0

" ==================== Theme ==============================
" colorscheme dracula
"
" colorscheme tokyonight

" There are also colorschemes for the different styles.
" colorscheme tokyonight-night
colorscheme tokyonight-storm
" colorscheme tokyonight-day
" colorscheme tokyonight-moon

" ==================== disable ruby provider==============================
let g:loaded_ruby_provider = 0
let g:loaded_node_provid = 0
let g:loaded_perl_provider = 0


" ==================== Dress up my vim ====================
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
silent! color deus

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70
"

" ==================== coc.nvim ====================
let g:coc_global_extensions = [
	\ 'coc-highlight',
	\ 'coc-lua',
	\ 'coc-stylua',
	\ 'coc-sumneko-lua',
	\ 'coc-clang-format-style-options',
	\ 'coc-cmake',
	\ 'coc-sh',
	\ 'coc-pairs',
	\ 'coc-diagnostic',
	\ 'coc-docker',
	\ 'coc-eslint',
	\ 'coc-markdownlint',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-import-cost',
	\ 'coc-java',
	\ 'coc-rust-analyzer',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-pyright',
	\ 'coc-snippets',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ 'coc-git',
	\ 'coc-yank']
" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()

" Use <LEADER>H to show documentation in a seperate window below
function! Show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <LEADER>H :call Show_documentation()<CR>

" Use H to show documentation in preview window
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('H', 'in')
  endif
endfunction
nnoremap <silent>H :call ShowDocumentation()<CR>

" set runtimepath^=~/.config/nvim/coc-extensions/coc-flutter-tools/
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let $NVIM_COC_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_FILE = '/Users/david/Desktop/log.txt'

" Jump between error the coc diagnose list
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Show the coc command list
nnoremap <c-c> :CocCommand<CR>

" Text Objects
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gD <Plug>(coc-definition)
nmap <silent> gd :tab sp<CR><Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader> rn <Plug>(coc-rename)

" coc-translator
nmap ts <Plug>(coc-translator-p)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w

" coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>

 " coc-snippets
imap <C-x> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
xmap <leader>x  <Plug>(coc-convert-snippet)
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc


" ==================== vim-instant-markdown ====================
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1


" ==================== vim-table-mode ====================
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'i<Bar>'


" ==================== wildfire ====================
nmap <leader>s <Plug>(wildfire-quick-select)
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "it"],
    \ "html,xml" : ["at", "it"],
\ }


" ==================== Undotree ====================
noremap U :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> k <plug>UndotreeNextState
	nmap <buffer> j <plug>UndotreePreviousState
	nmap <buffer> K 5<plug>UndotreeNextState
	nmap <buffer> J 5<plug>UndotreePreviousState
endfunc


" ==================== vim-visual-multi ====================
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
" let g:VM_custom_motions             = {'N': '0', 'M': '$'}
let g:VM_maps['Find Under']         = '<C-i>'
let g:VM_maps['Find Subword Under'] = '<C-I>'
let g:VM_maps['Find Next']          = 'n'
let g:VM_maps['Find Prev']          = 'N'
let g:VM_maps['Remove Region']      = 'Q'
let g:VM_maps['Skip Region']        = 'q'
let g:VM_maps["Redo"]               = '<C-r>'


" ==================== nvim-spectre ====================
nnoremap <LEADER>F <cmd>lua require('spectre').open()<CR>
vnoremap <LEADER>F <cmd>lua require('spectre').open_visual()<CR>


" ==================== Bullets.vim ====================
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]


" ==================== fzf-gitignore ====================
noremap <LEADER>gi :FzfGitignore<CR>


" ==================== vim-go ====================
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0


" ==================== goyo ====================
map <LEADER>gy :Goyo<CR>


" ==================== jsx ====================
let g:vim_jsx_pretty_colorful_config = 1


" ==================== tabular ====================
vmap ga :Tabularize /


" ==================== vim-after-object ====================
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')


" ==================== rainbow ====================
let g:rainbow_active = 1


" ==================== suda.vim ====================
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%


" ==================== vimspector ====================
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad


" ==================== vim-markdown-toc ====================
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'


" ==================== vim-illuminate ====================
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl


" ==================== vim-rooter ====================
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1


" ==================== AsyncRun ====================
noremap gp :AsyncRun git push<CR>


" ==================== AsyncTasks ====================
let g:asyncrun_open = 6


" ==================== dart-vim-plugin ====================
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
let g:dartfmt_options = ["-l 100"]


" ==================== tcomment_vim ====================
nnoremap ci cl
let g:tcomment_textobject_inlinecomment = ''
" nmap <LEADER>cn g
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<


" ==================== vim-move ====================
" let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'C'


" ==================== typescript-vim ====================
let g:typescript_ignore_browserwords = 1


" ==================== Agit ====================
nnoremap <LEADER>gl :Agit<CR>
let g:agit_no_default_mappings = 1


" ==================== nvim-treesitter ====================
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require'nvim-treesitter.configs'.setup {
	-- one of "all", "language", or a list of languages
	ensure_installed = {"vim","typescript", "dart", "rust", "java", "c", "prisma", "bash", "go", "cpp", "python", "lua", "cmake", "bash"},

	  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
endif


" ==================== nvim-scrollbar ====================
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require("scrollbar").setup()
require("scrollbar.handlers.search").setup()
require("scrollbar").setup({
	show = true,
	handle = {
		text = " ",
		color = "#928374",
		hide_if_all_visible = true,
	},
	marks = {
		Search = { color = "yellow" },
		Misc = { color = "purple" },
	},
	handlers = {
		diagnostic = true,
		search = true,
	},
})
EOF
endif


" ==================== nvim-hlslens ====================
noremap <silent> = <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> - <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>


" ==================== fzf-lua ====================
noremap <silent> <C-f>     :FzfLua files<CR>
noremap <silent> <C-b>     :FzfLua buffers<CR>
noremap <silent> <C-h>     :FzfLua oldfiles cwd=~<CR>
noremap <silent> <C-q>     :FzfLua builtin<CR>
noremap <silent> <C-l>     :FzfLua lines<CR>
noremap <silent> <LEADER>f :Rg<CR>
" noremap <silent> <C-x> :FzfLua resume<CR>
noremap <silent> z= :FzfLua spell_suggest<CR>
noremap <leader>; :FzfLua command_history<CR>
augroup fzf_commands
  autocmd!
  autocmd FileType fzf tnoremap <silent> <buffer> <c-j> <down>
  autocmd FileType fzf tnoremap <silent> <buffer> <c-k> <up>
augroup end


" ==================== rust ====================
let g:rustfmt_autosave = 1


" ==================== cpp ====================
" let g:clang_format#code_style = "google"
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
autocmd FileType c,cpp ClangFormatAutoEnable


" ==================== lazygit.nvim ====================
noremap <c-g> : LazyGit<CR>
let g:lazygit_floating_window_winblend       = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_border_chars   = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote              = 1 " for neovim-remote support


" ==================== rnvimr ====================
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> <LEADER>R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>' : 'NvimEdit tabedit',
            \ '<C-x>' : 'NvimEdit split',
            \ '<C-v>' : 'NvimEdit vsplit',
            \ 'gw'    : 'JumpNvimCwd',
            \ 'yw'    : 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width'  : &columns,
            \ 'height' : &lines,
            \ 'col'    : 0,
            \ 'row'    : 0,
            \ 'style'  : 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]


" ==================== joshuto ====================
noremap <silent> R :Joshuto<CR>
let g:joshuto_floating_window_winblend       = 0
let g:joshuto_floating_window_scaling_factor = 1.0
let g:joshuto_use_neovim_remote              = 1 " for neovim-remote support


" ==================== lightspeed ====================
nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
" autocmd BufEnter * map <buffer> <nowait> { <Plug>Lightspeed_S
map <nowait> " <Plug>Lightspeed_omni_s
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require'lightspeed'.setup {
  ignore_case = true,
  -- exit_after_idle_msecs = { unlabeled = 1000, labeled = nil },
  -- --- s/x ---
  -- jump_to_unique_chars = { safety_timeout = 400 },
  -- match_only_the_start_of_same_char_seqs = true,
  force_beacons_into_match_width = true,
  -- -- Display characters in a custom way in the highlighted matches.
  -- substitute_chars = { ['\r'] = '¬', },
  -- -- Leaving the appropriate list empty effectively disables "smart" mode,
  -- -- and forces auto-jump to be on or off.
  safe_labels= {"a", "r", "s", "t", "n", "e", "i", "o", "w", "f", "u", "y", "x", 'c', "v", "k", "m"},
  -- labels = {},
  special_keys = {
    next_match_group = '<space>',
    prev_match_group = '<tab>',
  },
}
EOF
endif


" ==================== any-jump====================
let g:any_jump_window_width_ratio  = 0.6
let g:any_jump_window_height_ratio = 0.6
let g:any_jump_window_top_offset   = 4


" ==================== im-select ====================
lua <<EOF
require("im_select").setup({})
EOF


" ==================== git-signs ====================
lua <<EOF
require('gitsigns').setup({
	signs = {
    add          = { hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    change       = { hl = 'GitSignsChange', text = '░', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '▔', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '▒', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
  },
})
EOF
nnoremap <leader>i  : Gitsigns preview_hunk_inline<CR>
nnoremap <LEADER>gr : Gitsigns reset_hunk<CR>
nnoremap <LEADER>gb : Gitsigns blame_line<CR>
nnoremap <LEADER>g- : Gitsigns prev_hunk<CR>
nnoremap <LEADER>g= : Gitsigns next_hunk<CR>


" ==================== nvim-tree/nvim-tree.lua ====================
lua<<EOF
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- custom mappings
  vim.keymap.set('n', 'q',    api.tree.close,                     opts('Close'))
  vim.keymap.set('n', 'h',    api.tree.change_root_to_parent,     opts('Up'))
  vim.keymap.set('n', 'O',    api.node.open.tab,                  opts('Open: New Tab'))
  vim.keymap.set('n', 'I',    api.node.open.vertical,             opts('Open: Vertical Split'))
  vim.keymap.set('n', '<CR>', api.node.open.edit,                 opts('Open'))
  vim.keymap.set('n', 'o',    api.node.open.edit,                 opts('Open'))
  vim.keymap.set('n', 'i',    api.node.open.edit,                 opts('Open'))
  vim.keymap.set('n', 'R',    api.tree.reload,                    opts('Refresh'))
  vim.keymap.set('n', 'a',    api.fs.create,                      opts('Create File'))
  vim.keymap.set('n', 'yy',   api.fs.copy.node,                   opts('Copy File'))
  vim.keymap.set('n', 'dd',   api.fs.cut,                         opts('Cut File'))
  vim.keymap.set('n', 'yp',   api.fs.copy.absolute_path,          opts('Copy Absolute Path'))
  vim.keymap.set('n', 'yn',   api.fs.copy.filename,               opts('Copy Name'))
  vim.keymap.set('n', 'cw',   api.fs.rename,                      opts('Rename'))
  vim.keymap.set('n', 'zh',   api.tree.toggle_hidden_filter,      opts('Toggle Hidden'))
  vim.keymap.set('n', '.',    api.tree.toggle_hidden_filter,      opts('Toggle Hidden'))
  vim.keymap.set('n', 'zi',   api.tree.toggle_gitignore_filter,   opts('Toggle Gitignore'))
  vim.keymap.set('n', '[c',   api.node.navigate.git.prev,         opts('Prev Git'))
  vim.keymap.set('n', ']c',   api.node.navigate.git.next,         opts('Next Git'))
  vim.keymap.set('n', 'L',    api.tree.expand_all,                opts('Expand All'))
  vim.keymap.set('n', '[d',   api.node.navigate.diagnostics.next, opts('Diagnostics Next'))
  vim.keymap.set('n', ']d',   api.node.navigate.diagnostics.prev, opts('Diagnostics Prev'))
  vim.keymap.set('n', ']d',   api.node.navigate.diagnostics.prev, opts('Diagnostics Prev'))
  vim.keymap.set('n', 'f',    api.live_filter.start,              opts('Filter'))
  vim.keymap.set('n', '/',    api.tree.search_node,               opts('Search'))
  vim.keymap.set('n', 'n',    api.tree.collapse_all,              opts('Collapse'))
  vim.keymap.set('n', 'n',    api.tree.collapse_all,              opts('Collapse'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
}
EOF
nnoremap tt :NvimTreeToggle<CR>


"" ==================== tabby ====================
lua<<EOF
vim.o.showtabline = 2

local theme = {
  fill = 'TabLineFill',
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = 'TabLine',
  -- current_tab = 'TabLineSel',
  current_tab = { fg = '#F8FBF6', bg = '#896a98', style = 'italic' },
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}

require('tabby.tabline').set(function(line)
  return {
    {
      { '  ', hl = theme.head },
      line.sep('', theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep('', hl, theme.fill),
        tab.is_current() and '' or '',
        tab.number(),
        tab.name(),
        tab.close_btn(''), -- show a close button
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    -- shows list of windows in tab
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      return {
        line.sep('', theme.win, theme.fill),
        win.is_current() and '' or '',
        win.buf_name(),
        line.sep('', theme.win, theme.fill),
        hl = theme.win,
        margin = ' ',
     }
    end),
    {
      line.sep('', theme.tail, theme.fill),
      { '  ', hl = theme.tail },
    },
    hl = theme.fill,
  }
end)
EOF


"===================== lualine.vim =====================
"
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
	tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
EOF
endif


"" ==================== lukas-reineke/indent-blankline.nvim ====================
lua<<EOF
local highlight = {
		"RainbowRed",
		"RainbowYellow",
		"RainbowBlue",
		"RainbowOrange",
		"RainbowGreen",
		"RainbowViolet",
		"RainbowCyan",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { scope = { highlight = highlight } }

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
EOF

"" ==================== Terminal Colors ====================
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" ==================== Necessary Commands to Execute ====================
exec "nohlsearch"
