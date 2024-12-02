# Command-Line Interface
## Java & Maven command
```
# Manage multi-version of Java 
jenv local
jenv global
jenv shell
# Define
# https://docs.oracle.com/javase/tutorial/essential/environment/sysprop.html
mcp -Dos.arch=x86_64
# Activate Profile
# 可以使用如下命令查看当前激活的 profile：
mvn help:active-profiles
# 也可以使用如下命令查看所有的 profile：
mvn help:all-profiles
mcp -Pdev
```

## IDEA
```
# idea 使用 jj 映射 Esc 键
inoremap jj <Esc>

# File Header
# Settings -> Editor -> File and Code Templates -> Includes
/**
 * @Author: ${USER}
 * @Email: 
 * @Date: ${DATE} ${TIME}
 * @Desc: ${description}
 */
```

## Visual Studio Code
```
# Theme: Light (Visual Studio) Visual Studio Light

# Vim: Handle Keys -> Edit in settings.json
// vscode 使用 jj 映射 Esc 键
"vim.insertModeKeyBindings": [
  {
      "before": ["j", "j"],
      "after": ["<Esc>"]
  }
],

# 开启使用快捷键触发 vim 开关
# Keyboard Shortcuts -> Vim: Toggle Vim Mode -> Keybinding -> ctrl + option + v
```

## basic linux environment(for ML/DL Software Engineer)
```
# file manager
mv a_file b_file to -t c_dir
# 可以查看当前目录下各文件、文件夹的大小，这个比较实用
du -h --max-depth=1

# git
# 生成ssh秘钥
ssh-keygen -t rsa -C "xxx@xx.com"

# vim 
ln -s ~/.config_backup/.vimrc .vimrc
# 配置需要安装 vundle 模块
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim ~/.vimrc

# zsh
ln -s ~/.config_backup/.bashrc .bashrc
vim ~/.bashrc
source ~/.bashrc
.zshenv

# tmux
ln -s ~/.config_backup/.tmux.conf .tmux.conf

# PySpark
# before install pyspark, you need install java env
# pyspark 3.2.0 -> java 1.8
pip install pyspark


# jupyter
pip install jupyterlab
# 解决jupyter无法自动补齐的问题
pip install jedi==0.17.2

jupyter notebook list
jupyter notebook password

# 后台运行jupyter lab
nohup jupyter notebook --allow-root --ip=X.X.X.X --port 8888 > myjupyter.log 2>&1 &
nohup jupyter lab --allow-root --ip=X.X.X.X --port 80 > myjupyter.log 2>&1 &
# 查看 jupyter 密码
jupyter server list

# TensorBoard 需指定logs目录
tensorboard --logdir logs/fit --host X.X.X.X
nohup tensorboard --logdir logs/fit --host X.X.X.X > mytensorboard.log 2>&1 &

```

## 虚拟环境的管理
```
# anaconda
# 查看已经存在的环境
conda info -e
conda env list
# 创建虚拟环境，并指定python版本
conda create -n dev python=3.8.6
# 激活dev环境
conda activate dev
# 退出虚拟环境
conda deactivate
# 删除虚拟环境
conda remove -n test
# 复制虚拟环境
conda create -n test

# docker
# 拉取镜像
docker pull docker_addr
# 列出本地主机上的镜像
docker images
# 登录镜像
docker run -t -i ubuntu:14.04 /bin/bash 

```

## basic include
* vim configuration file
* tmux configuration file
## CLI tools(Applications in terminal / console_toolkit / command line tools)
* CLI 只是一个对于底层功能的接口，而并不是程序或者系统的全部
* neofetch/screenfetch/pfetch
* Audio Visualiser
    * Cava
* lazygit
* launcher
    * dmenu
    * Rofi
* autojump
* figlet
* monitor
    * htop/gtop
    * Conky
* Filemanager
    * ranger
    * nnn
    * fff
    * vifm 
    * lf
* qutebrowser
* cmatrix
    * 字符流
* tpp
    * 在终端上演示PPT的程序
    * http://www.ngolde.de/tpp.html
    * wget * tpp-1.3.1.tar.gz
    * tar -zxvf
    * make install
    * yum -y install ruby-devel rubygems
    * gem install  ncurses-ruby
    * tpp test.tpp
* wego 天气预报
* flameshot linux截屏
* tree
* https://github.com/darknessomi/musicbox
* ncmpcpp
* tray 托盘

## K8S
* Kubernetes 
* 自动化运维管理Docker（容器化）程序
* 主从设备模型（Master-Slave架构）

## hexo
* 本地安装hexo
* hexo new project
* project 目录下安装 scaffolds 主题
* 迁移 scource 和 scaffolds 文件夹
* 安装 hexo-deployer-git 插件 npm install hexo-deployer-git --save
* hexo d 部署(check git ssh 已配置完毕)

## chmod(Win to Mac)
常用权限
* -rw------- (600)      只有拥有者有读写权限。
* -rw-r--r-- (644)      只有拥有者有读写权限；而属组用户和其他用户只有读权限。
* -rwx------ (700)      只有拥有者有读、写、执行权限。
* -rwxr-xr-x (755)      拥有者有读、写、执行权限；而属组用户和其他用户只有读、执行权限。
* -rwx--x--x (711)      拥有者有读、写、执行权限；而属组用户和其他用户只有执行权限。
* -rw-rw-rw- (666)      所有用户都有文件读、写权限。
* -rwxrwxrwx (777)      所有用户都有读、写、执行权限。

chmod分别设置子目录和文件不同权限
要求就是：
1、将当前目录中的所有“子目录”的权限设置为755；
2、将当前目录中的所有“文件”的权限设置为644。

```
# 将当前目录下所有文件的权限设置为 rwxr-xr-x 即755 此时目录文件拥有755
chmod -R 755 *
# 将当前目录下所有普通文件权限设置为 rw-r--r-- 即 644 此时目录文件拥有755，普通文件拥有权限644
chmod 644 `find . -type f`
# 针对包含空格文件的处理，详细可参考 https://blog.csdn.net/cahesi/article/details/106083375
find . -type f -print0 | xargs -0 sudo chmod 644

# 也可以用find彻底些
# find 命令默认递归，不递归查找 -maxdepth 1
find /path -type f -exec chmod 644 {} /;
find /path -type d -exec chmod 755 {} /;
```

## reference
* [哪些命令行工具让你相见恨晚？](https://www.zhihu.com/question/41115077)
* [有哪些命令行的软件堪称神器？](https://www.zhihu.com/question/59227720)
