## How to setup the lua config files and installation of some dependencies
## 如何使用老杨的lua neovim配置文件以及dependencies安装简介

### git clone my repo if you want (克隆老杨的配置repo)

### Install Neovim 0.7+ version (安装Neovim 0.7+ 版本)
如果想使用老杨的配置文件，需要比较新的Nim版本，Ubuntu并不会一定现在最近的Stable版本。
可使用PPA 方法，添加；或者用源文件安装。
最简单的方法是添加unstable PPA。
```ubuntu
sudo add-apt-repository ppa:neovim-ppa/stable (if stable doesn't work for you try unstable)
sudo apt-get update
sudo apt-get install neovim
```

### Install lua language on your Linux system (安装lua)

```ubuntu
sudo apt install luaX.X
```

### Install Packer.nvim for plugins (安装Packer)
```ubuntu
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Install Nerd font and apply it into your terminal selection (安装nerd font mono)

Download from nerd fonts and create ~/.local/share/fonts folder, copy your font files here (just neater, not neccessary). Run following command, the config your
terminal.

```ubuntu
fc-cache -fv
```

### Use nerd font cheat sheet to select your customized symbols. 

### Install nodejs, and npm for lspconfig language server (安装nodejs, npm需要用来安装language servers)
```ubuntu
npm i -g pyright
```

### Use source the lua config files (source 配置文件)
```vim
:so
```
then run Packer command to install the plugins (运行如下命令更新并安装插件)
```vim
:PackerSync
```

### Tips worth to mention (值得点出来的一些小细节)
Use the following command to check if the installation is successful.
```vim
:checkhealth (with optional package names)
```

如果使用中文输入想得到跟VSCode一样的使用体验，尽量使用带有mono的字体。

使用google baidu来解决一些其他小问题，作为一个合格的程序员要学会独自处理问题。

老杨使用了一些YouTuber的教程来完成了repo里的配置文件，shouting thanks to following YouTubers:
* Tuff Gniuz (majority 大部分)
* chris@machine (Autopairs)
* ziontee113 (Lua Snippets)

如何个性化设置快捷键是仁者见仁，智者见智的。按照个人的喜好来设置键位可以让NVim在你的手里更顺手。

### TODO @laoyang
后续添加
* python linting, found flake8, syntastic, ale | 完成language server的lint，找到几个插件
* lua language server | 完成类似pyright的language server配置 - sumneko\_lua，需要这个插件的原因是，做snippets时的语法大部分都是使用的lua，如果想写出高效好用的snippets还是要学一下插件的写法的。有lua的language server会更省心一些。
* python snippets customization and implementation | 添加个人配置的python snippets

