# Quick configuration for vim

TODO: Enrich the manual.

# Testing

✓: Full tested
✗: Not tested

- [✓] macos
- [✗] Ubuntu 16.04 LTS
- [✗] Windows 10

# How to install?

    git clone https://github.com/ikey4u/vim.git ~/.vim


When the clone is done, edit `~/.vim/vimrc` and configure specific variables:

- `g:pyhome`  The python3 home, there should be several directories:

    ├── bin/
    ├── include/
    ├── lib/
    └── share/
- `g:idapro` and `g:idaprotag` If you write IDA script, you may need set them.
- `g:terminal` The full path to your terminal binary.
- `g:openex` The command to open file explorer

Now, open your gvim and run `:PlugInstall`, it will install the basics for your vim.
If you want to have the full features, you should press `\man` in vim to open the embedded
manual to install dependency.
