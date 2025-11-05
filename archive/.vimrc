set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
"source ~/.vim_runtime/vimrcs/plugins_config.vim
"source ~/.vim_runtime/vimrcs/extended.vim

"try
"source ~/.vim_runtime/my_configs.vim
"catch
"endtry

"Added by Tak
set nu
map <F2> :NERDTreeToggle<cr>
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/NERDTree'
call vundle#end()



if has("gui_running")
    colorscheme solarized
    if &diff
        colorscheme apprentice
        set cursorline
        map <C-S-Down> ]c
        map <C-S-UP> [c
        "map <C-S-Left> do
        map <C-S-Right> dp
    endif
endif
