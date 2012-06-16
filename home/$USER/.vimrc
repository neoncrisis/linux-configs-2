" The ArchLinux global vimrc - setting only a few sane defaults
"
" Maintainer:      Tobias Kieslich [tobias funnychar archlinux dot org]
"
" NEVER EDIT THIS FILE, IT'S OVERWRITTEN UPON UPGRADES, GLOBAL CONFIGURATION
" SHALL BE DONE IN /etc/vimrc, USER SPECIFIC CONFIGURATION IN ~/.vimrc

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible                " Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start  " more powerful backspacing

" Now we set some defaults for the editor
set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pacnew


if has('gui_running')
  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" Java Stuff
set sm
set ai
syntax on
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

" Set tab width
set tabstop=2
set shiftwidth=2
set expandtab
