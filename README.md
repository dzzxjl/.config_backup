# Command-Line Interface
## basic linux environment(for ML/DL Software Engineer)
```
# vim 
ln -s ~/.config_backup/.vimrc .vimrc
vim ~/.vimrc

# zsh
ln -s ~/.config_backup/.bashrc .bashrc
vim ~/.bashrc
source ~/.bashrc

# tmux
ln -s ~/.config_backup/.tmux.conf .tmux.conf

# PySpark
# before install pyspark, you need install java env && java 1.8
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

```
# 虚拟环境的管理
```
# anaconda

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
