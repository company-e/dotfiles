let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/vimfiler')
call dein#add('vim-scripts/SingleCompile')
call dein#add('vim-scripts/DoxygenToolkit.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('tomtom/tcomment_vim')
call dein#add('junegunn/vim-easy-align')
call dein#add('simeji/winresizer')
call dein#add('itchyny/lightline.vim')
call dein#add('tyru/caw.vim')
call dein#add('t9md/vim-quickhl')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/neocomplete.vim')
call dein#add('thinca/vim-quickrun')
call dein#add('justmao945/vim-clang')
call dein#add('reireias/vim-cheatsheet')

" インサートモード時に有効化
call dein#add('Shougo/neocomplete.vim',         {'on_i':1})
" call dein#add('Shougo/neosnippet.vim',          {'on_i':1})
" call dein#add('Shougo/neosnippet-snippets.vim', {'on_i':1})

" タイルタイプがRubyの時に有効化
"call dein#add('osyo-manga/vim-monster', {'on_ft':'fuby' })

call dein#end()

" 未インストールのプラグインがある場合には、プラグインのインストール処理
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
colorscheme molokai
set t_Co=256
"let g:molokai_original = 1
"let g:rehash256 = 1
"set background=dark


" 検索関係
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別する]:
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト

" 編集関係
set hidden              " バッファを閉じる代わりに隠す
set tabstop=4           " タブ幅をスペース４つ分にする
set expandtab           " tabを半角スペースで挿入する
set shiftwidth=4        " vimが自動で生成するtab幅をスペース４つにする

" 表示関係
"set list               " 不可視文字の可視化
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number              " 行番号の表示
set relativenumber      " 相対位置の番号で表示
set title       
set showcmd             " ウィドウの右下にまだ実行していない入力中のコマンドを表示
set display=lastline    " 省略されずに表示
set cmdheight=2         " コマンドウィンドウの高さを２行にする
set laststatus=2        " ステータス行を常に表示

"------- Cursor -----"
"挿入モードでカーソル形状を変更する
let &t_SI.="\e[6 q"
let &t_EI.="\e[2 q"
"カーソル形状がすぐに元に戻らないのでタイムアウト時間を調整
set ttimeoutlen=10
"挿入モードを抜けた時にカーソルが見えなくなる現象対策(なぜかこれで治る)
inoremap <ESC> <ESC>
set mouse=a
" 設定
set nobackup            " バックアップファイルは作らない
set noswapfile         " スワップファイルは作らない

" マクロおよびキー設定
" 入力モード中に素早くと入力した場合はESCとみなす
inoremap <silent> jj <ESC>
inoremap っｊ<CR> <ESC>

" 検索後にジャンプ下際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, kによる移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" キーコードシーケンスが終了するのを待つ時間を短くする
set ttimeoutlen=10

" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" vを２回で行末まで選択
vnoremap v $h

" TABで対応ペアにジャンプ
nnoremap <TAB> %
vnoremap <TAB> %

" ウィンドウ感の移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

function! ImInActivate()
    call system('fcitx-remote -c')
endfunction
" inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>
inoremap <silent> <ESC> <ESC>:call ImInActivate()<CR>

" 挿入モードでバックスペースが効かないときの対応方法
" http://wonderwall.hatenablog.com/entry/2016/03/23/232634
set backspace=indent,eol,start

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!

    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
"""""""""""""""""""""""""""""

" vim-gitgutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'

" lightline.vim
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'filename'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter',
        \ },
        \ 'separator': {'left': '⮀', 'right': '⮂'},
        \ 'subseparator': {'left': '⮁', 'right': '⮃'}
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

"================================================
" コメントアウトを切り替えるマッピング
" \c でカーソル行をコメントアウト
" 再度 \c でコメントアウトを解除
" 選択してから複数行の \c も可能
nmap \c <Plug>(caw:I:toggle)
vmap \c <Plug>(caw:I:toggle)

" \C でコメントアウトの解除
nmap \C <Plug>(caw:I:uncomment)
vmap \C <Plug>(caw:I:uncomment) 

"================================================
" <Space>m でカーソル下の単語、もしくは選択した範囲のハイライトを行う
" 再度 <Space>m を行うとカーソル下のハイライトを解除する
" これは複数の単語のハイライトを行う事もできる
" <Space>M で全てのハイライトを解除する
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

"================================================
"neocomplete
" 補完を有効にする
let g:neocomplete#enable_at_startup = 1

" 補完に時間がかかってもスキップしない
let g:neocomplete#skip_auto_completion_time = ""


"================================================
"vim-cheatsheet
let g:cheatsheet#cheat_file = '~/cheatsheet.md'

"================================================
""vim-easy-align
" ヴィジュアルモードで選択し，easy-align 呼んで整形．(e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" easy-align を呼んだ上で，移動したりテキストオブジェクトを指定して整形．(e.g. gaip)
nmap ga <Plug>(EasyAlign)

"termdebug
packadd termdebug
set mouse=a
let g:termdebug_wide = 163
