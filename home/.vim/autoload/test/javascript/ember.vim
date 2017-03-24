if !exists('g:test#javascript#ember#file_pattern')
  let g:test#javascript#ember#file_pattern = '\vtests?/.*\.(js|jsx|coffee)$'
endif

" Returns true if the given file belongs to your test runner
function! test#javascript#ember#test_file(file) abort
  return a:file =~# g:test#javascript#ember#file_pattern
endfunction

" Returns test runner's arguments which will run the current file and/or line
function! test#javascript#ember#build_position(type, position) abort
  if a:type == 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      let name = '--filter '.shellescape(name, 1)
    endif
    return [a:position['file'], name]
  elseif a:type == 'file'
    return [a:position['file']]
  else
    return []
  endif
endfunction

" Returns processed args (if you need to do any processing)
function! test#javascript#ember#build_args(args)
  let args = a:args

  if test#base#no_colors()
    let args = ['--no-colors'] + args
    let args = args + ['|', 'sed -e "s///g"']
  endif

  return args
endfunction

" Returns the executable of your test runner
function! test#javascript#ember#executable() abort
  return 'ember test'
endfunction

function! s:nearest_test(position)
  let name = test#base#nearest_test(a:position, g:test#javascript#patterns)
  return (len(name['namespace']) ? '^' : '') .
       \ test#base#escape_regex(join(name['namespace'] + name['test']))
endfunction
