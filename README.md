# lsp installer

## Updates

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
