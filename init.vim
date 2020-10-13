"---------------------------------------------------------Basic Settings---------------------------------------------------------
"---(Let vim like notepad)
syntax on
set number
set cursorline
set wrap
set showcmd
set wildmenu
set relativenumber
set tabstop=4
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set scrolloff=18
"---(Let vim can decoding windows Platform's file)
let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,big5
"---(Map ClickBoard | CopyAndPaste)
nnoremap Y y$
vnoremap Y "+y
"---------------------------------------------------------Basic Settings---------------------------------------------------------
"---------------------------------------------------------Quick Operations-------------------------------------------------------
"---Global && Important key
let mapleader=" "
"---Map Quick Jump
noremap K 13k
noremap J 13j
noremap L 30l
noremap H 30h
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-b> <Up>
cnoremap <c-n> <Down>
cnoremap <c-h> <Left>
cnoremap <c-l> <Right>
noremap - n
noremap = N
noremap <BS> <c-O>
noremap fb <c-O>
noremap gb <c-^>
"---Set&Map Start&Stop HighLightSearch
set hlsearch
exec "nohlsearch"
noremap <LEADER><CR> :nohlsearch<CR>
"---Map Quick Save
map S :w<CR>
map Q :q<CR>
"---Map Quick Open
"---VIMRC
map R :source ~/.config/nvim/init.vim<CR>
map <Leader>rc :e ~/.config/nvim/init.vim<CR>
"---LazyGit
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>
"---Map Quick Panel | Map Split Screen
set splitbelow
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
"noremap <LEADER>j <C-w>j
"unmap <LEADER>k
"noremap <LEADER>k <C-w>K
"noremap <LEADER>i <C-w>i
"---Map Tab Operation
map tu :tabe<CR>
map tb :-tabnext<CR>
map tn :tabnext<CR>
"---Set a Quick Linux Shell
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>
"---Set
"---IDE Like
inoremap <c-a> <Esc>A   
"nnoremap <c-a> <Esc>A   
"---Quick Run Program
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    if &filetype == 'c'
        exec '!gcc %  -o %<'
        exec '!./%<'
    elseif &filetype == 'cpp'
        exec '!g++ %  -o %<'
        exec '!./%<'
    elseif &filetype == 'html'
			exec 'Bracey'
    elseif &filetype == 'java'
		exec '!javac %'
		exec '!java %<'
    elseif &filetype == 'javascript'
        exec '!node %'
    elseif &filetype == 'markdown'
	    exec 'MarkdownPreview'
    elseif &filetype == 'python'
	"exec "!time python %"
		set splitbelow
		:sp
		":term go run .
		:term python %
    elseif &filetype == 'sh'
	exec "!time /bin/bash %"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		":term go run .
		:term go run %
    endif
endfunc 
"---------------------------------------------------------Quick Operations-------------------------------------------------------






" ===========================================================PLUG=============================================================
call plug#begin('~/.config/nvim/plugged')
"===========================================================VimDress===========================================================
Plug 'happysmile12321/change-colorscheme'
Plug 'junegunn/goyo.vim'
Plug 'lambdalisue/suda.vim'
Plug 'mhinz/vim-startify'
Plug 'mg979/vim-xtabline'
"===========================================================VimDress===========================================================
"==========================================================SystemTools==========================================================
"Plug 'lilydjwg/fcitx.vim'
" Auto ComPlete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Untransparent Find
Plug 'junegunn/fzf',{ 'do':{ -> fzf#install()}}
" Quick Format 
Plug 'tpope/vim-surround' "type ysiw to add surround ;type cs <surround> <new surround> to change surround
" Code Debugger
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}
" ClickBoard 
Plug 'junegunn/vim-peekaboo'
Plug 'ajmwagar/vim-deus'
Plug 'yuratomo/w3m.vim'
"==========================================================SystemTools==========================================================
"==========================================================Codding==============================================================
"==========================================================Document==========================================================
"===
"== Plug('vimwiki/vimwiki')
Plug 'vimwiki/vimwiki'
"===
"==========================================================SystemTools==========================================================
"=======================Markdown=======================
" Markdown
" ==Markdown 
" ==Preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
" ==Markdown 
" ==PasteImage
Plug 'ferrine/md-img-paste.vim' 
" ==Markdown 
" ==Format(Markdown,Table)
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'dkarter/bullets.vim'
"=======================Snippets=======================
" snippets
Plug 'honza/vim-snippets'
"=======================Snippets=======================
"=======================Markdown=======================
"=========================Html=========================
Plug 'turbio/bracey.vim'
"=========================Html=========================
"==========================Go==========================
" go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
"==========================Go==========================
"==========================================================Codding==============================================================
call plug#end()


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~PlugConfigration~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"~~~Plug('happysmile12321/change-colorscheme')
noremap <LEADER>1 :NormalLife <CR>
noremap <LEADER>2 :RebackToWork <CR>

"~~~Plug 'mg979/vim-xtabline'
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.show_right_corner = 0

let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.last_open_first = 1

"~~~Plug 'vim-plug airline theme'
let g:airline_theme='simple'


"~~~=======================Document=======================
"~~~Plug('vimwiki/vimwiki')
filetype plugin on
"Set wiki data stored on my disk
let g:vimwiki_list = [{'path': '~/.config/nvim/plugged/vimwiki/wikidocs/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
"Usage 
"<Leader>ww -- Open default wiki index file.
"<Leader>wt -- Open default wiki index file in a new tab.
"<Leader>ws -- Select and open wiki index file.
"<Leader>wd -- Delete wiki file you are in.
"<Leader>wr -- Rename wiki file you are in.
"<Enter> -- Follow/Create wiki link.
"<Shift-Enter> -- Split and follow/create wiki link.
"<Ctrl-Enter> -- Vertical split and follow/create wiki link.
"<Backspace> -- Go back to parent(previous) wiki link.
"<Tab> -- Find next wiki link.
"<Shift-Tab> -- Find previous wiki link.
"
":Vimwiki2HTML -- Convert current wiki link to HTML.
":VimwikiAll2HTML -- Convert all your wiki links to HTML.
":help vimwiki-commands -- List all commands.
":help vimwiki -- General vimwiki help docs.
"~~~=======================Markdown=======================
"~~~Plug 'dhruvasagar/vim-table-mode'
map t :TableModeToggle<CR>
function! s:isAtStartOfLine(mapping)
	  let text_before_cursor = getline('.')[0 : col('.')-1]
	  let mapping_pattern = '\V' . escape(a:mapping, '\')
	  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
	  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
	  endfunction
	     inoreabbrev <expr> <bar><bar>
	          \ <SID>isAtStartOfLine('\|\|') ?
	          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
	     inoreabbrev <expr> __
	          \ <SID>isAtStartOfLine('__') ?
	          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
"~~~Plug 'vim-markdown-toc'
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
"~~~Plug 'ferrine/md-img-paste.vim' (paste md image)
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = './assets'
"~~~bullets.vim(when type - or * in markdown,it can auto type Tab)
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'gitcommit',
    \]
"~~~Dress
set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark    " Setting dark mode
colorscheme deus
let g:deus_termcolors=256
"~~~=======================Markdown=======================
"
"~~~==========================Go==========================
"~~~Plug 'fatih/vim-go'
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
"~~~==========================Go==========================
"
"~~~=========================Html=========================
"If you want to use own browser,follow the link:https://stackoverflow.com/questions/41172692/xdg-open-not-open-default-browser
"~~~=========================Html=========================
"
"~~~======================ComPlete========================
"~~~Plug 'neoclide/coc.nvim'
"
"~~~CoC extensions Register in VIMRC,CoC extensions's config in coc-settings(Because it like vscode)
let g:coc_global_extensions = ['coc-json','coc-vimlsp','coc-sh','coc-rome','coc-html','coc-python','coc-translator','coc-marketplace','coc-actions','coc-snippets','coc-explorer','coc-yank','coc-todolist']
"~~~CoC todolist
" coctodolist
nnoremap <leader>tc :CocCommand todolist.create<CR>
nnoremap <leader>tl :CocList todolist<CR>
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
"~~~CoC LSP Bash
"~~~https://github.com/bash-lsp/bash-language-server
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }
"~~~CoC coc-snippets
noremap es  :CocCommand snippets.editSnippets<CR>
" 切换snippets位置
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
" 加自己是谁
let g:snips_author = 'Zhen'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
" coc-translate
nmap <Leader>\ <Plug>(coc-translator-p)
vmap <Leader>\ <Plug>(coc-translator-pv)
"~~~CoC explorer
nmap tt :CocCommand explorer<CR>
" ~~~CoC Basic Configration
" coc.nvim config 
" Manager Coc iteself
" 允许未保存文件的情况下跳到其他文件。（放到vim缓冲区里面） 
set hidden
" 如果什么都没做把文件写到磁盘
set updatetime=100
" 补全时信息栏少打一些东西 
set shortmess+=c
set signcolumn=yes
" 用Tab来触发补全
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_kack_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <leader>rn <Plug>(coc-rename)
" Ctrl + o 触发补全
inoremap <silent><expr> <c-o> coc#refresh()
" Enter选中补全的内容
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" 用 `[g` 和 `]g` 查找上一个和下一个代码报错 
nmap <silent> <leader>-  <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>=  <Plug>(coc-diagnostic-next)
" 查看函数定义，调用，实现，引用 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" 显示文档
noremap <silent> H :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" 代码折叠
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
"右键代码功能选项
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Mappings using CoCList:
" Show all diagnostics.
" nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"~~~======================ComPlete========================
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~PlugConfigration~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

