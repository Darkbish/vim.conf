个人 `vim` 配置

# install

使用 `curl` 下载脚本进行安装

```
curl -sLf https://raw.githubusercontent.com/Darkbish/vim.conf/master/install.sh | bash -s -- install
```

安装后，打开 `vim`，输入 `:PluginInstall`，安装插件。

插件安装完成后，如果使用 [onedark](https://github.com/joshdick/onedark.vim) 主题，手动进入 `~/.vim.conf` 目录运行 `./install.sh theme` 复制主题文件到相应目录。

# uninstall

进入 `~/.vim.conf` 目录运行 `./install.sh uninstall` 卸载 `vim` 配置。
