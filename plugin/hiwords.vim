"hiwords.vim
"2013.5.7 多种颜色, 严格匹配单词
"2014.8.7 使用独立的颜色模式

if exists('g:loaded_hiwords')
    finish
endif

let g:loaded_hiwords = 1

map <silent> <leader>j :call Highlight_Word()<CR>
map <silent> <leader>J :call Highlight_Word_Clear()<CR>

highlight HI_WORD_0 ctermbg=1 ctermfg=7   "红
highlight HI_WORD_1 ctermbg=2 ctermfg=7   "绿
highlight HI_WORD_2 ctermbg=3 ctermfg=1   "黄
highlight HI_WORD_3 ctermbg=5 ctermfg=7   "紫
highlight HI_WORD_4 ctermbg=4 ctermfg=7   "蓝
highlight HI_WORD_5 ctermbg=6 ctermfg=7   "青

let g:HI_WORD_Index = 0
let g:HI_WORD_Count = 6
let g:HI_WORD_Map = {}

function! Highlight_Word()
    let word = expand('<cword>')
    let g:HI_WORD_Map[word] = g:HI_WORD_Index
    let g:HI_WORD_Map[word] = matchadd('HI_WORD_'.(g:HI_WORD_Index), '\<'.word.'\>')
    let g:HI_WORD_Index = (g:HI_WORD_Index + 1) % g:HI_WORD_Count
endfunction

function! Highlight_Word_Clear_One()
    let word = expand('<cword>')
    if has_key(g:HI_WORD_Map, word)
        call matchdelete(g:HI_WORD_Map[word])
        call remove(g:HI_WORD_Map, word)
    endif
endfunction

function! Highlight_Word_Clear()
    call clearmatches()
    let g:HI_WORD_Map = {}
endfunction
