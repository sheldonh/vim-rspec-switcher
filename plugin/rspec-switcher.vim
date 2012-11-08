function! RspecSwitcherFindBinary()
  if system('bundle list | grep "rspec ([^1]"') != ""
    let l:binary = "rspec"
  else
    let l:binary = "spec"
  endif
  return l:binary
endfunction

if !exists("g:rspecswitcherRspecExecutable")
  let g:rspecswitcherRspecExecutable = RspecSwitcherFindBinary()
endif

nnoremap <leader>s :exec "!clear; bundle exec " . g:rspecswitcherRspecExecutable . " --drb -cfs " . bufname("%") . ":" . line(".")<CR>
nnoremap <leader>S :exec "!clear; bundle exec " . g:rspecswitcherRspecExecutable . " --drb -cfs " . bufname("%")<CR>
