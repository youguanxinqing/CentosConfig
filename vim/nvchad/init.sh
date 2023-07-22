mv ~/.config/nvim/lua/custom ~/.config/nvim/lua/custom.bak
ln -s `pwd`/custom ~/.config/nvim/lua/

mv ~/.config/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json.bak
ln -s `pwd`/custom/lazy-lock.json ~/.config/nvim/lazy-lock.json
