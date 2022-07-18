"""""""""""""""""""""""
""" AUTOPAIRS
"""""""""""""""""""""""
let g:AutoPairs = {'(':')', '[':']', '{':'}', "`":"`", '```':'```', '"':'"', "'''":"'''", '*':'*', '**':'**', '***':'***'}
let g:AutoPairsMapSpace = 0

"""""""""""""""""""""""
""" BUFSURF
"""""""""""""""""""""""
let g:BufSurfIgnore = 'NetrwTreeListing,NetrwTreeListing[-]'

"""""""""""""""""""""""
""" NETRW
"""""""""""""""""""""""
let g:netrw_preview       = 1
let g:netrw_liststyle     = 3
let g:netrw_banner        = 0
let g:netrw_winsize       = 15

"""""""""""""""""""""""
""" TERRAFORM
"""""""""""""""""""""""
let g:terraform_fmt_on_save=1
let g:terraform_align=1

"""""""""""""""""""""""
""" ZEAVIM
"""""""""""""""""""""""
let g:zv_get_docset_by = ['ext', 'file', 'ft']
let g:zv_file_types = {
            \   'tf'                : 'terraform',
            \   'pkr.hcl'           : 'packer',
            \   'yml'               : 'kubernetes,ansible',
            \   'yaml'              : 'kubernetes,ansible',
            \   'tex'               : 'latex',
            \   'Vagrantfile'       : 'vagrant'
            \ }

"""""""""""""""""""""""
""" MARKDOWN
"""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

"""""""""""""""""""""""
""" VIMUX
"""""""""""""""""""""""
let g:VimuxHeight       = "20"
let g:VimuxOrientation  = "v"
let g:VimuxUseNearest   = 1
let g:VimuxCloseOnExit  = 1

"""""""""""""""""""""""
""" STARTIFY
"""""""""""""""""""""""
let g:indentLine_enabled            = 0
let g:startify_enable_special       = 0 "don't show <empty buffer> and <quit>
let g:startify_files_number         = 5
let g:startify_change_to_vcs_root   = 1
let g:startify_update_oldfiles      = 1 "update recent files on the fly not on exit
let g:startify_relative_path        = 1 "don't show ~/ on recent files
let g:webdevicons_enable_startify   = 0

let g:startify_skiplist = [
          \ '.*startify\.txt$',
          \ '.*\.gitignore$',
          \ '^/tmp/calcurse-note.*',
          \ '.*\Session.vim$'
          \]

let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Session']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmark']      },
          \ { 'type': 'files',     'header': ['   Recent']            },
          \ ]

let g:startify_bookmarks = [
            \ { 'cc': '~/.config' },
            \ { 'in': '~/.local/bin' },
            \ { 'vi': '~/.config/nvim' },
            \ { 'tf': '~/dev/terraform' },
            \ { 'bl': '~/dev/jekyll/codeblog/_posts' },
            \ { 'td': '~/dev/.todo.md' },
            \ ]

" " Isometric
" let g:startify_custom_header = [
"           \ '      /\__\          ___        /\__\     ',
"           \ '     /:/  /         /\  \      /::|  |    ',
"           \ '    /:/  /          \:\  \    /:|:|  |    ',
"           \ '   /:/__/  ___      /::\__\  /:/|:|__|__  ', 
"           \ '   |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ ',
"           \ '   |:|  |/:/  / /\/:/  /    \/__/~~/:/  / ',
"           \ '   |:|__/:/  /  \::/__/           /:/  /  ',
"           \ '    \::::/__/    \:\__\          /:/  /   ',
"           \ '     ~~~~         \/__/         /:/  /    ',
"           \ '                                \/__/     ',
"           \]

" let g:startify_custom_header = [
"           \ '                              ___       ',
"           \ '       ___       ___         /__/\      ',
"           \ '      /__/\     /  /\       |  |::\     ',
"           \ '      \  \:\   /  /:/       |  |:|:\    ',
"           \ '       \  \:\ /__/::\     __|__|:|\:\   ',
"           \ '   ___  \__\:\\__\/\:\__ /__/::::| \:\  ',
"           \ '  /__/\ |  |:|   \  \:\/\\  \:\~~\__\/  ',
"           \ '  \  \:\|  |:|    \__\::/ \  \:\        ',
"           \ '   \  \:\__|:|    /__/:/   \  \:\       ',
"           \ '    \__\::::/     \__\/     \  \:\      ',
"           \ '        ----                 \__\/      ',
"           \]

let g:startify_custom_header = [
          \ '                        %%#                       ',
          \ '     /%%%%%%%%%%%%%%%% *****##  %%%%%%%%%%%%%%%%/ ',
          \ '     @//@%%%%%%%%%//// *******# @//%%%%%%%%%%%%/  ',
          \ '        @%%%%%%%%%// ********** @@%%%%%%%%%%//    ',
          \ '        @%%%%%%%%%// ******** @@%%%%%%%%%%//      ',
          \ '        @%%%%%%%%%// ***** @@/%%%%%%%%%%/         ',
          \ '        @%%%%%%%%%// *** @@%%%%%%%%%%// ##        ',
          \ '      % @%%%%%%%%%//  @@/%%%%%%%%%%/  *****##     ',
          \ '    %%* @%%%%%%%%%//@@%%%%%%%%%%// **********##   ',
          \ ' ,,**** @%%%%%%%%%/@%%%%%%%%%%/  ***************,,',
          \ '    ,,* @%%%%%%%%%%%%%%%%%%// ***************,,   ',
          \ '      , @%%%%%%%%%%%%%%%% %%%**************,,     ',
          \ '        @%%%%%%%%%%%%%%/ ***************,,        ',
          \ '        @%%%%%%%%%%%//  %%% *  %%%%  %%%%%%%%%%   ',
          \ '        @%%%%%%%%%/ ***%%% ** %%%**, %%     %%    ',
          \ '        @%%%%%%// ****%%% ***%%% ,, %%%    %%     ',
          \ '        @%%%%/     ,, %%  ** %%    %%%    %%%     ',
          \ '                     ,,*****,,                    ',
          \ '                        ,,,                       ',
          \]
