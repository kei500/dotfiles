set cursorline      " カーソル行のハイライト
set cursorcolumn    " 列をハイライト
set laststatus=2    " 末尾から2行目にステータスラインを表示
set list            " 不可視文字表示
set listchars=tab:>\ ,trail:-,extends:>,precedes:<  " 不可視文字の表示を指定
set number          " 行番号を表示
set ruler           " カーソルの位置を表示
set showcmd         " コマンドをステータスラインに表示
set showmatch       " 対応括弧のハイライト
set showmode        " 現在のモードをステータスラインに表示
set title           " タイトルを表示

" 全角スペースを強調
augroup ZenkakuSpace
  autocmd!
  autocmd VimEnter,Colorscheme * highlight ZenkakuSpace term=underline ctermbg=red
  autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
augroup END
