set nocompatible               " be iMproved

filetype off
filetype plugin indent on

""""""""""""""""""""""""""""""
" プラグインのセットアップ
"""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible               " Be iMproved
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

 "Let NeoBundle manage NeoBundle
 "Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " ファイルオープンを便利に
 NeoBundle 'Shougo/unite.vim'
 " sudoでファイルオープン
 NeoBundle 'sudo.vim'
 " Unite.vimで最近使ったファイルを表示できるようにする
 NeoBundle 'Shougo/neomru.vim'
 " ファイルをtree表示してくれる
 NeoBundle 'scrooloose/nerdtree'
 " Gitを便利に使う
 NeoBundle 'tpope/vim-fugitive'

 " コメントON/OFFを手軽に実行
 NeoBundle 'tomtom/tcomment_vim'
 " シングルクオートとダブルクオートの入れ替え等
 NeoBundle 'tpope/vim-surround'

 "インデントに色を付けて見やすくする
 NeoBundle 'nathanaelkane/vim-indent-guides'

  " ログファイルを色づけしてくれる
 NeoBundle 'vim-scripts/AnsiEsc.vim'
 " 行末の半角スペースを可視化(うまく動かない？)
 NeoBundle 'bronson/vim-trailing-whitespace'
 " less用のsyntaxハイライト
 NeoBundle 'KohPoll/vim-less'

 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'hail2u/vim-css3-syntax'

 NeoBundle 'vim-scripts/Wombat'
 NeoBundle 'mattn/emmet-vim'

 NeoBundle 'fatih/vim-go'
 NeoBundle 'pangloss/vim-javascript'
 NeoBundle 'kchmck/vim-coffee-script'
 NeoBundle 'violetyk/cake.vim'

 " Tagbarのプラグイン"
 NeoBundle 'majutsushi/tagbar.git'

 " markdown用のバンドル
 NeoBundle 'plasticboy/vim-markdown'
 NeoBundle 'kannokanno/previm'
 NeoBundle 'tyru/open-browser.vim'

 " Tagにジャンプする
 NeoBundle 'szw/vim-tags'

call neobundle#end()

" 余談: neocompleteは合わなかった。ctrl+pで補完するのが便利
 NeoBundleCheck

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" タグファイルの指定(でもタグジャンプは使ったことがない)
 set tags=~/.tags

 " スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
 set noswapfile
 " カーソルが何行目の何列目に置かれているかを表示する
 set ruler
 " コマンドラインに使われる画面上の行数
 set cmdheight=2
 " エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
 set laststatus=2

 " ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
 set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
 " ステータス行に現在のgitブランチを表示する
 set statusline+=%{fugitive#statusline()}
 " ウインドウのタイトルバーにファイルのパス情報等を表示する
 set wildmenu wildmode=list:full
 " 入力中のコマンドを表示する
 set showcmd
 " バックアップディレクトリの指定(でもバックアップは使ってない)
 set backupdir=$HOME/.vimbackup

 " 小文字のみで検索したときに大文字小文字を無視する
 set smartcase
 " 検索結果をハイライト表示する
 set hlsearch
 " 暗い背景色に合わせた配色にする
 set background=dark
 " タブ入力を複数の空白入力に置き換える
"  set expandtab
 " 検索ワードの最初の文字を入力した時点で検索を開始する
 set incsearch
 " 保存されていないファイルがあるときでも別のファイルを開けるようにする
 set hidden
 " 不可視文字を表示する
 set list
 " タブと行の続きを可視化する
 set listchars=tab:>-,trail:-,extends:<,nbsp:%
 " 行番号を表示する
 set number

 " 対応する括弧やブレースを表示する
 set showmatch
 " 改行時に前の行のインデントを継続する
 set autoindent
 " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
 set smartindent
 " タブ文字の表示幅
 set tabstop=2
 " Vimが挿入するインデントの幅
 set shiftwidth=2
 " 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
 set smarttab
 " カーソルを行頭、行末で止まらないようにする
 set whichwrap=b,s,h,l,<,>,[,]

 " カーソル行の背景色を変える
 set cursorline

 set scrolloff=8                " 上下8行の視界を確保
 set sidescrolloff=16           " 左右スクロール時の視界を確保
 set sidescroll=1               " 左右スクロールは一文字づつ行う

 set clipboard=unnamed " クリップボードを使用する
 set backspace=indent,eol,start " Backspaceで削除を可能にする
 set autoread "外部でファイルに変更がされた場合は読みなおす

 set fencs=iso-2022-jp,sjis,euc-jp
 set encoding=utf-8
 set fileencodings=utf-8,euc-jp,sjis,
 set fileformats=unix,dos,mac

 set rtp+=$GOROOT/misc/vim
 set completeopt=menu,preview
 " 構文毎に文字色を変化させる
 syntax enable
 syntax on
 " カラースキーマの指定
 colorscheme wombat
 " 行番号の色
 highlight LineNr ctermfg=darkyellow

 """"""""""""""""""""""""""""""

" この設定入れるとshiftwidthを1にしてインデントしてくれる
 let g:SimpleJsIndenter_BriefMode = 1
" この設定入れるとswitchのインデントがいくらかマシに
 let g:SimpleJsIndenter_CaseIndentLevel = -1

 " vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
 let g:indent_guides_enable_on_vim_startup = 1

 " grep検索の実行後にQuickFix Listを表示する
 autocmd QuickFixCmdPost *grep* cwindow

 " http://blog.remora.cx/2010/12/vim-ref-with-unite.html
 "

 """"""""""""""""""""""""""""""
 " vim-tagsの設定
 """"""""""""""""""""""""""""""
  map <C-h> :vsp <CR> :exec("tag ".expand("<cword>"))<CR>
  map <C-k> :split <CR> :exec("tag ".expand("<cword>"))<CR>

 """"""""""""""""""""""""""""""
 " Unit.vimの設定
 """"""""""""""""""""""""""""""
 " 入力モードで開始する
 let g:unite_enable_start_insert=1
 " バッファ一覧
 noremap <C-P> :Unite buffer<CR>
 " ファイル一覧
 noremap <C-N> :Unite -buffer-name=file file<CR>
 " 最近使ったファイルの一覧
 noremap <C-Z> :Unite file_mru<CR>
 " sourcesを「今開いているファイルのディレクトリ」とする
 noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
 " NERDTreeを開く
 nnoremap <silent><C-t> :NERDTree<CR>
 " 隠しファイルをデフォルトで表示させる
 let NERDTreeShowHidden = 1
 " デフォルトでツリーを表示させる
"  autocmd VimEnter * execute 'NERDTree'

 autocmd VimEnter * execute 'TagbarOpen'

 " ウィンドウを分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
 au FileType unite inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')

 " ウィンドウを縦に分割して開く
 au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
 au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')

 " ESCキーを2回押すと終了する
 au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
 au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>



 """"""""""""""""""""""""""""""
 " http://inari.hatenablog.com/entry/2014/05/05/231307
 """""""""""""""""""""""""""""" " 全角スペースの表示
 function! ZenkakuSpace()
   highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
   endfunction

 if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
 endif

""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""

" tagbar の設定
let g:tagbar_left = 0
let g:tagbar_autoshowtag = 1   " :TagbarShowTag を叩かなくても有効にする
" let g:tagbar_autofocus = 1

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
 if has("autocmd")
   autocmd BufReadPost *
   \ if line("'\"") > 0 && line ("'\"") <= line("$") |
   \   exe "normal! g'\"" |
   \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
 imap { {}<LEFT>
 imap [ []<LEFT>
 imap ( ()<LEFT>
 imap < <><LEFT>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" cakephp用設定
""""""""""""""""""""""""""""""
let g:cakephp_enable_auto_mode = 1
nnoremap <Space>cc :Ccontrollervsp
nnoremap <Space>cm :Cmodelvsp
nnoremap <Space>cv :Cviewvsp
""""""""""""""""""""""""""""""

" markdown用設定
""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Firefox'
noremap <C-M> :PrevimOpen<CR>

""""""""""""""""""""""""""""""
" coffee用設定
""""""""""""""""""""""""""""""
 " vimにcoffeeファイルタイプを認識させる
 au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
 " インデント設定
 autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
 " オートコンパイル
 "保存と同時にコンパイルする
 autocmd BufWritePost *.coffee silent make!
 "エラーがあったら別ウィンドウで表示
 autocmd QuickFixCmdPost * nested cwindow | redraw!
 " Ctrl-cで右ウィンドウにコンパイル結果を一時表示する
 nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h

""""""""""""""""""""""""""""""
" go用設定
""""""""""""""""""""""""""""""

let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['go'] }
let g:syntastic_go_checkers = ['go', 'golint']

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"" GoFmt時にインポートするパッケージを整理
let g:go_fmt_command = "goimports"

autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
autocmd FileType go setlocal noexpandtab
au FileType go nmap gt (go-test)

" MEMO:$GOPATHがなければ手動でパス指定
if $GOPATH != ''
  " golintの実行パスを追加
  execute "set rtp+=".globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
endif

" 保存時に自動で:Fmtをかける(syntastic関係ない)
" augroup Go
"   autocmd GoFmt
" augroup END

""""""""""""""""""""""""""""""
 " javascript
""""""""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""
 " "PHP用設定
""""""""""""""""""""""""""""""

 " PHP辞書ファイル指定
 autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
 " :makeでPHP構文チェック
 au FileType php setlocal makeprg=php\ -l\ %
 au FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
 " PHPの関数やクラスの折りたたみ
 let php_folding = 0
 " 文字列の中のSQLをハイライト
 let php_sql_query = 1
 " Baselibメソッドのハイライト
 let php_baselib = 1
 " HTMLもハイライト
 let php_htmlInStrings = 1
 " <? を無効にする→ハイライト除外にする
"  let php_noShortTags = 1
 " ] や ) の対応エラーをハイライト
 let php_parent_error_close = 1
 let php_parent_error_open = 1
 " SQLのPHP文字リテラルへの整形(:Sqltop, :Sqlfromp)
 function! SQLToPHP()
 %s/^\(.\+\)$/"\1 " \./g

  normal G$
  execute "normal ?.&lt;CR&gt;"
  normal xxggVG
  echo "Convert to PHP String is finished."
  endfunction
  command! Sqltop :call SQLToPHP()
  function! SQLFromPHP()
  %s/^"\(.\+\) " *\.*$/\1/g

   normal ggVG
   echo "Convert from PHP String is finished."
   endfunction
   command! Sqlfromp :call SQLFromPHP()
   " ハイライト色設定
   highlight Pmenu ctermbg=4
   highlight PmenuSel ctermbg=1
   highlight PMenuSbar ctermbg=4

""""""""""""""""""""""""""""""

if filereadable(expand('~/.vim/neobundle.vim/syntax/jquery.vim'))
  source ~/.vim/neobundle.vim/syntax/jquery.vim
endif

" vimdiffの色設定
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on
filetype plugin on

