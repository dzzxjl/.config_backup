# Command-Line Interface
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
# idea使用jj映射Esc键
inoremap jj <Esc>

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

# 虚拟环境的管理
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
## other CLI tools
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
*
## K8S
* Kubernetes 
* 自动化运维管理Docker（容器化）程序
* 主从设备模型（Master-Slave架构）


## reference
* [哪些命令行工具让你相见恨晚？](https://www.zhihu.com/question/41115077)
* [有哪些命令行的软件堪称神器？](https://www.zhihu.com/question/59227720)
