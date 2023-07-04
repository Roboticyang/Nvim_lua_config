# My Dotfiles for Neovim (in lua)

How to setup the lua config files and installation of some dependencies
如何使用老杨的lua neovim配置文件以及dependencies安装简介

## Table of content

* Checkout my videos [at bilibili](https://space.bilibili.com/2915291/)
* Basic installation and setups: [how to config and install](#how-to-install-and-config)
* More issues posted here with solutions: [more practical issue with solutions](#issues-with-solutions)

## How to Install and Config

1. Migrated the language-servers to lsp-installer folder.
2. The setup, config, on-attach, and capabilities are created in handlers.
3. Use setting folder to store all ls customized modifications.

## How to use lsp-installer

```bash
:LspInstall <ls-names>
```

Use the above command to install the ls you needed. To Uninstall is vice versa.

```bash
:LspInstallInfo
```

Use the above command to see the details of all servers, use "U" to update all
ls's.

## Small tips for your IDE

1. Use virtual\_text = false to remove the linter style texts behind your
code lines.
2. Use global variables in sumneko\_lua to remove the warnings on vim. and use.
lines.
3. In your setup and config handlers dotfile, you can use server == \<ls-name\>
to customize your requirements on different servers.

## Personal needs

For me, I only need sumneko\_lua to help with checking lua syntax, while mainly
coding my code snippets. I can work with using complex installations of ls's.
If you need multi ls's in your IDE for complex devop activities. I suggest you
to install this lsp-install plugins. Although it might not have all the ls's
you want, it works as a great lsp manager style to make your life easier.

## System requirements

I have no idea, how the plugins will impact your resources (not sure how much
burdon will be applied to your system). Please make sure back-up your docfiles
while working on your customization of your lua setup.

## Small tips & items for this repo

### Source the lua config files (source 配置文件)

Run the following line to source the recent updates.
运行如下命令行，配置刚刚更新的配置文件，也叫dotfiles.

```vim
:so
```

Then run Packer command to install the plugins (运行如下命令更新并安装插件)

```vim
:PackerSync
```

### Tips worth to mention (值得点出来的一些小细节)

Use the following command to check if the installation is successful.
可以用下面的命令来检查插件安装是否成功。

```vim
:checkhealth (with optional package names)
```

如果使用中文输入想得到跟VSCode一样的使用体验，尽量使用带有mono的字体。

使用google baidu来解决一些其他小问题，作为一个合格的程序员要学会独自处理问题。

老杨使用了一些YouTuber的教程来完成了repo里的配置文件，shouting thanks to following YouTubers:

* Tuff Gniuz (majority 大部分)
* chris@machine (Autopairs, null-ls)
* ziontee113 (Lua Snippets, null-ls)

如何个性化设置快捷键是仁者见仁，智者见智的。按照个人的喜好来设置键位可以让NVim在你的手里更顺手。
看着花里胡哨的不如用得趁手的配置。

### lua language server

It is pretty standard to follow the lspconfig github server configuration readme
file for any issue you experience or customization you want. The detailed steps
are as following:
特别值得说的是，lspconfig的阅读文档特别的好，关于配置的详细信息可以参考他的详细说明。
如果不是老杨使用的features，可以参照文档找到合适的repo来找到知道方向。也有用来
借鉴如何使用其他插件的套路。找到所在的github repo写好配置文件，很快就能使用了。

老杨在这里提供了安装lua language server的一个方法，具体叫做sumneko\_lua, 是lua的ls。
因为会经常使用lua来制作很多code snippets，可以稍微学习下lua，安装一个ls是有帮助的。

1. Make sure you have c++17 with your g++. Write a simple cpp file, and comple
with -std=c++17 to see if it is compatibal with your environment.
2. Install Ninja using the following:
3. Go to sumneko\_lua location and following the build instructions. Make sure
you have added the lua-language-server folder in your $PATH variable.
4. Add 'sumneko\_lua' to your language servers in lua files. Done!

```ubuntu
sudo apt-get install ninja-build
```

If you are using ubuntu 18.04 like me, and my gcc -v version is only 7.5. Althrough
it supports g++17. But you might meet error when installing sumneko\_lua like I did,
prompting a filesystem error. I solved this via upgrading my gcc-6 to gcc-9.
You can refer to this upgrade online anywhere via use ppa: ubuntu-toolchain-r/test.

如果你跟我一样用的是18.04，你的gcc可能在安装sumneko\_lua的时候遇到错误提示不认识filesystem。
老杨是通过升级到gcc-9来解决的问题，我的虚拟机上安装的是20.04就没有遇到这个问题自带的是gcc-9。

这里有一些如何在你的shell rc文档里优雅的添加一些路径到环境变量中。有兴趣的可以尝试一下。
For adding the path's to your environment variable. I spend sometime to found a
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

检查你路径添加的是否正确，可以用下面的命令输出：

```ubuntu
echo $PATH
```

如果需要删除添加错误的路径，是的这很正常 lol：

```ubuntu
PATH=`echo $PATH | sed -e 's/:\/home\/wrong\/dir\/$//'`
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
what I did in null-ls-config folder. It will work just fine. Assuming you have,
all the dependencies installed. If you need other linter for different file
type from my selection. Check the formatting and diagnostics folders for the
ones you need. Then add to your config file.

Also it is worth to mention, in lspconfig keymap section. There are a few
hotkeys you should consider to use frequently. You can also follow the video
from chris@machin and Tuff Gnuiz. They both have videos on this topic.
一些非常实用的插件

1. vim.diagnostic.open\_float() - which goes to a float linter prompt
2. vim.lsp.buf.format() - which format the whole script.
3. vim.diagnostic.goto\_next({cannot be nil value}) - go to the next
warning/error etc
4. vim.diagnostic.goto\_prev({cannto be nil value}) - go to the previous
warning/error etc

## Issues with Solutions

This section will be updated when issues are encountered and solved. Might
use branches to work on more complex issues, see next section for additional
branches.

### PackerSync failed to update issue

You might encounter issue that the github plugins are fast-forwarded. This is
not a good practice, but it will happen eventually. The most dummy-proof way
to solve this is by uninstall and reinstall the plugin.

1. Go to your packer.nvim dotfile. Comment the plugin use line.
2. If you have customized setups, comment the setups files as well.
3. Save and source your dotfiles. Reopen them.
4. In command line use **PackerClean** to uninstall the plugins you commented.
5. Revert the comment you just did, and use **PackerSync** again to install them
back.

Another way to solve this is to setup your packer nvim update with **git rebase**.
Via doing so, it can solve this problem, but might left pitfalls in future.

### Virtual texts from ls

There are virtual texts from the language servers and are not neat for my own
taste. I would very much like to disable them. There is a way to do so via using
lsp-installer. Please check out my bilibili video and git branch.

### Global linter or ls variable not recognized

For linter you can try to use the linter .rc files to add the global variables.
And for the ls, it can be setup in the dotfiles. The solution has been shown in
lsp-installer. Please check out my bilibili video and git branch.

## lsp-installer merged to main

The lsp-installer branch is finally merged to main.

## What I have done in the new revision

### Expand this work to macOS ( Around Feb 2023 )

I have successfully migrated this repo to macOS on iTerm2. It seems all working okay.
One thing we need to keep in mind is that the keybindings or keymappings should be
adjusted, due to the different keyboards are used between macOS and Ubuntu.

The outdated functions must be replaced and there are many small details like dependencies,
and missing packages like npm. Try use checkHealth to work out the whole package.

### Updated the deprecated codes for barbar ( Around March 2023 )

A minor syntax update. Follow the warning messages.

### Nerd font upgrade ( Around March 2023 )

Nerd font recently have been updated majorly. One may need to update the
installed nerd font or re-install the nerd font. Some of the characters shall be
updated in your code or dotfiles.

### Editing with LaTeX file updates ( Around June 2023 )

I have extended my needs with LaTeX file editing. Therefore, I included more features:

1. I installed Vimtex via Packer.
2. Then I installed new lsp language server, texlab (which is an equivalent tool
to vimtex, based on my research). I am still testing out the lsp and plugins.
3. I tried with ltex_ls, which is not working well with lsp.
4. Configuration for Vimtex, for reverse search in the pdf file.
5. Follow the instructions to install tlmgr and basicTex on my macOS
6. Install the Skim pdf Previewer (which has sync function)
7. Test the pdf tex file di-search functionality.
8. Small fix conflict between Vimtex and Tree-sitter by disable TS for tex FileType.
9. The texlab dotfile can be googled and copied.
10. tlmgr can be used to install packages in LaTeX environment or formatting and
diagnostics in null-ls plugins. I used latexindent for formatting, chktex for
diagnostics.
11. Link with your overleaf account, things are getting even better!
12. Based on my research, the entire process for Ubuntu are quite similar, which
is a good news.

Lastly, there are many steps that I have done for the features above. It took
me about 3 days to set this environment up. So if you felt that I missed a few steps.
You are correct. The best thing you could do is to search and try for yourself.

### Adding the auto-complete for latex ( Around July 2023 )

Follow the help information from Vimtex in nvim:

1. Install using packer, cmp-omni
2. Update the configuration file for nvim-cmp
3. Test with latex file.
