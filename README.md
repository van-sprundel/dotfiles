# Dotfiles

## Requirements
- Git
- GNU Stow
- Alacritty
- Fish shell (oh-my-fish for themes)
- Neovim
- nvm

### Arch:

```fish
sudo pacman -Syyu git stow alacritty fish neovim                                                                                            # Packages 
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher    # Fisher
fisher install jorgebucaran/nvm.fish                                                                                                        # Node Version Manager
nvm install lts && nvm use lts                                                                                                              # Install latest LTS version of node
node --version 2> set --universal nvm_default_version                                                                                       # Set global node version
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish                                                      # oh-my-fish
```

