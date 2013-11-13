nnoremap \c :s/^/# /<CR>:nohls<CR>
nnoremap ,c :s/^\(\s*\)/\1# /<CR>:nohls<CR>
nnoremap ,<S-c> :s/^\(\s*\)#\s\?\(\s*\)/\1\2/<CR>:nohls<CR>

vnoremap ,c :s/^/# /<CR>:nohls<CR>
vnoremap \c :s/^\(\s*\)/\1# /<CR>:nohls<CR>
vnoremap ,<S-c> :s/^\(\s*\)#\s\?\(\s*\)/\1\2/<CR>:nohls<CR>
