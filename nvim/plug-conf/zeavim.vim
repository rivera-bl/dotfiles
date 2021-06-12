" by default uses:
" let g:zv_get_docset_by = ['file', 'ext', 'ft']
let g:zv_get_docset_by = ['ext', 'file', 'ft']

let g:zv_file_types = {
            \   'tf' : 'terraform',
            \   'pkr.hcl'  : 'packer',
            \   'yml'  : 'ansible',
            \   'tex' : 'latex'
            \ }

" usage:
" <leader>z on top of word to search on zeal
" gz<motion> to search motion on zeal
