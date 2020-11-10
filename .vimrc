""" BASIC SETUP:

" Don't try to be vi compatible
set nocompatible

" Enable syntax highlighting and plugins (for netrw)
syntax enable
filetype plugin on



""" FINDING FILES:

" Search down into subfolders
" Provides tab completion for all file-related tasks
set path+=**

" Display all matching files for tab completion
set wildmenu

" NOW WE CAN
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" - Use :b to autocomplete any open buffers



""" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack



""" AUTOCOMPLETE:

" NOW WE CAN
" - ^x^n for just this file
" - ^x^f for filenames (works with path trick)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option



""" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0          " disable annoying banner
let g:netrw_browse_split=4    " open in prior window
let g:netrw_altv=1            " open splits to the right
let g:netrw_liststyle=3       " tree view

