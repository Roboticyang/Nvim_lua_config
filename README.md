# How to setup the lua config files and installation of some dependencies

## 如何使用老杨的lua neovim配置文件以及dependencies安装简介

### git clone my repo if you want (克隆老杨的配置repo)

### Install Neovim 0.7+ version (安装Neovim 0.7+ 版本)

如果想使用老杨的配置文件，需要比较新的Nim版本，Ubuntu并不会一定现在最近的Stable版本。
可使用PPA 方法，添加；或者用源文件安装。
最简单的方法是添加unstable PPA。

```ubuntu
sudo add-apt-repository ppa:neovim-ppa/stable
(if stable doesn't work for you try unstable)
sudo apt-get update
sudo apt-get install neovim
```

### Install lua language on your Linux system (安装lua)

老杨使用的版本是5.3。

```ubuntu
sudo apt install luaX.X
```

### Install Packer.nvim for plugins (安装Packer)

```ubuntu
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Install Nerd font and apply it into your terminal selection (安装nerd font mono)

Download from nerd fonts and create ~/.local/share/fonts folder, copy your font
files here (just neater, not neccessary). Run following command, the config your
terminal.

```ubuntu
fc-cache -fv
```

### Use nerd font cheat sheet to select your customized symbols

### Install nodejs, and npm for lspconfig language server

(安装nodejs, npm需要用来安装language servers)

```ubuntu
npm i -g pyright
```

### Source the lua config files (source 配置文件)

Run the following line to source the recent updates.
运行如下命令行，配置刚刚跟新的配置文件，也叫dotfiles.

```vim
:so
```

Then run Packer command to install the plugins (运行如下命令更新并安装插件)

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

### lua language server

It is pretty standard to follow the lspconfig github server configuration readme
file. The detailed steps are as following:
特别值得说的是，lspconfig的阅读文档特别的好，关于配置的详细信息可以参考他的详细说明。
如果不是老杨使用的features，可以参照文档找到合适的repo来找到知道方向。

老杨在这里提供了安装lua language server的一个方法，具体叫做sumneko\_lua, 是lua的ls。
会经常使用lua来制作很多code snippets，可以稍微学习下lua是有帮助的。

1. Make sure you have c++17 with your g++. Write a simple cpp file, and comple
with -std=c++17 to see if it is compatibal with your environment.
2. Install Ninja using the following:
3. Go to sumneko\_lua location and following the build instructions. Make sure
you have added the lua-language-server folder in your $PATH variable.
4. Add 'sumneko\_lua' to your language servers in lua files. Done!

```ubuntu
sudo apt-get install ninja-build
```

这里有一些如果在你的shell rc文档里优雅的添加一些路径到环境变量中。有兴趣的可以尝试一下。
For adding the path's to your enviroment variable. I spend sometime to found a
way of doing it neatly. Of course you can use if-then-do-fi as well. Case is
just for demenstration purposes. And the extra\_path variable/list contains
all extra path's you want to check in your .bashrc or .zshrc dotfile.

```shell
# Useful Functions
for p in ${extra_path[*]}; do
	case ":$PATH:" in
		*:$p:*) ;;
		*) PATH="${PATH:+${PATH}:}$p" ;;
	esac;
done
```

### Customized lua snippets for python files

Learn some lua coding, we should be able to create snippets with the details
from YouTuber zionTee113.
It it really nice to do less typing more coding.
老杨的很多snippets都是用lua写的，所以定制自己喜欢的snippets的时候需要使用到
一些lua，不难，但是需要学一些东西，也可以照搬各位大佬的。

### Linter, finally selected with null-ls

下面是老杨使用的linter，具体是用来对编程的格式优化，会省去不少心力。
你值得拥有。
Because of the neat and flourish documentation of the repo. I decided to use
null-ls as the linter bridge between lsp and neovim. And for my coding
format requirements. I used black, pylint, lua\_check and markdownlint.

For using black, install as following: python

```ubuntu
pip install black
```

For using pylint, install as following: python

```ubuntu
sudo apt install pylint
```

For using markdownlint-cli, install via npm: markdown

```ubuntu
sudo npm install -g markdownlint-cli
```

For lua\_check, install as following: lua

```ubuntu
sudo apt install lua-check
```

null-ls 是一款用来让nvim可以配置，使用更多ls的插件。非常好上手，值得提出的是
它也有特别好的说明文档，如果有什么特别的个人定制需求，可以很简单找到需要的项目。
For configuration of null-ls, it is pretty easy. If there is any cutomization
required, please refer to the documentation of null-ls repo. Otherwise follow
we I did in null-ls-config folder. It will work just fine.

Also it is worth to mention, in lspconfig keymap section. There are a few
hotkeys you should consider to use frequently. You can also follow the video
from chris@machin and Tuff Gnuiz. They both have videos on this topic.
一些非常实用的插件

1. open\_float() - which goes to a float linter prompt
2. format() - which format the whole script.
3. goto\_next({cannot be nil value}) - go to the next warning/error etc
4. goto\_prev({cannto be nil value}) - go to the previous warning etc
