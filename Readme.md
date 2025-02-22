
# My dotfiles

Feel free to copy ideas or fork

## Install
```sh
git clone git@github.com:c0d5x/dotfiles.git ~/git/dotfiles/
```

## Run
```sh
cd ~/git/dotfiles

# option 1
make

# option 2
ansible-playbook -i "localhost," -c local playbook.yml

```

## Notes

* I use zsh as my main shell
* I use `neovim` but `vim` is also configured by default with the same configuration as nvim
