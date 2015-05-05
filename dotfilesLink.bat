::Make windows sym-links.
::Windows native
mklink    "C:\Users\%USERNAME%\_gvimrc"             "C:\msys64\home\%USERNAME%\dotfiles\.gvimrc"
mklink /D "C:\Users\%USERNAME%\vimfiles"            "C:\msys64\home\%USERNAME%\dotfiles\.vim"
mklink    "C:\Users\%USERNAME%\_vimrc"              "C:\msys64\home\%USERNAME%\dotfiles\.vimrc"
mklink /D "C:\Users\%USERNAME%\vimperator"          "C:\msys64\home\%USERNAME%\dotfiles\.vimperator"
mklink    "C:\Users\%USERNAME%\.vimperatorrc"       "C:\msys64\home\%USERNAME%\dotfiles\.vimperatorrc"
::msys2
mklink    "C:\msys64\home\%USERNAME%\.bash_profile" "C:\msys64\home\%USERNAME%\dotfiles\.bash_profile"
mklink    "C:\msys64\home\%USERNAME%\.bashrc"       "C:\msys64\home\%USERNAME%\dotfiles\.bashrc"
mklink    "C:\msys64\home\%USERNAME%\.inputrc"      "C:\msys64\home\%USERNAME%\dotfiles\.inputrc"
mklink    "C:\msys64\home\%USERNAME%\.minttyrc"     "C:\msys64\home\%USERNAME%\dotfiles\.minttyrc"
mklink    "C:\msys64\home\%USERNAME%\.gvimrc"       "C:\msys64\home\%USERNAME%\dotfiles\.gvimrc"
mklink /D "C:\msys64\home\%USERNAME%\.vim"          "C:\msys64\home\%USERNAME%\dotfiles\.vim"
mklink /D "C:\msys64\home\%USERNAME%\vimfiles"      "C:\msys64\home\%USERNAME%\dotfiles\.vim"
mklink    "C:\msys64\home\%USERNAME%\.vimrc"        "C:\msys64\home\%USERNAME%\dotfiles\.vimrc"
mklink /D "C:\msys64\home\%USERNAME%\.zsh"          "C:\msys64\home\%USERNAME%\dotfiles\.zsh"
mklink    "C:\msys64\home\%USERNAME%\.zshenv"       "C:\msys64\home\%USERNAME%\dotfiles\.zshenv"
mklink    "C:\msys64\home\%USERNAME%\.tmux.conf"    "C:\msys64\home\%USERNAME%\dotfiles\.tmux.conf"
