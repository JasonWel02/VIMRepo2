
" An example for a gvimrc file.
		" The commands in this are executed when the GUI is started, after the vimrc
" has been executed.
"
" Maintainer:	The Vim Project <https://github.com/vim/vim>
" Last Change:	2023 Aug 10
" Former Maintainer:	Bram Moolenaar <Bram@vim.org>
"
" To use it, copy it to
"         for Unix:  ~/.gvimrc
"        for Amiga:  s:.gvimrc
"   for MS-Windows:  $VIM\_gvimrc
"        for Haiku:  ~/config/settings/vim/gvimrc
"      for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
  highlight Normal guibg=grey90
  highlight Cursor guibg=Green guifg=NONE
  highlight lCursor guibg=Cyan guifg=NONE
  highlight NonText guibg=grey80
  highlight Constant gui=NONE guibg=grey95
  highlight Special gui=NONE guibg=grey95

endif

packadd lsp
" Python LSP Server
call LspAddServer([#{name: 'pylsp',
                 \   filetype: 'python',
                 \   path: '/usr/bin/pylsp',
                 \   args: []
                 \ }])
" HTML Language Server.
call LspAddServer([#{name: 'emmet',
                 \   filetype: 'html',
                 \   path: '/usr/local/bin/emmet-language-server',
                 \   args: ['--stdio'],
                 \ }])
" Javascript/Typescript language server
call LspAddServer([#{
	\    name: 'typescriptlang',
	\    filetype: ['javascript', 'typescript'],
	\    path: '/usr/local/bin/typescript-language-server',
	\    args: ['--stdio'],
	\  }])
call LspAddServer([#{name: 'csharp-ls',
		\ filetype: 'cs',
		\ path: '/Users/jmw/.dotnet/tools/csharp-ls',
		\ }])



let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector
let mapleader=" "

nnoremap <leader>r :LspDiag next
autocmd VimEnter * NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nmap <Leader>db <Plug>VimspectorBreakpoints
colorscheme desert
nnoremap <leader>q :qa!<CR>
nnoremap <leader>, :vertical resize +5<CR>
nnoremap <leader>.  :vertical resize -5<CR>
noremap <leader>s :w<CR>
nnoremap <C-o> :LspHover<CR>
