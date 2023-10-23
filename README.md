# bash-aliases
.aliases (text) file with my favorite aliases for downloading/using on a new machine

wget -c https://github.com/don-ferris/terminal-cfg/raw/main/.aliases

Usage:

On new machine...
```
cd ~ && git init
git remote add origin https://github.com/don-ferris/bash-aliases.git
git pull origin main
echo 'source ~/.aliases' >> ~/.bashrc
source ~/.bashrc && cat ~/.bashrc
alias
```
Last command lists all the new aliases. Review and done.
