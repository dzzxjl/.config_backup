# Java env config
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home
PATH=$JAVA_HOME/bin:$PATH:.
CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:.
export JAVA_HOME
export PATH
export CLASSPATH

# Maven env config
MAVEN_HOME=/usr/local/apache-maven-3.9.3
PATH=$MAVEN_HOME/bin:$PATH
export MAVEN_HOME
export PATH

# Go env config
export GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/go

# Go proxy
export GO111MODULE=on
export GOPROXY=https://goproxy.cn

# zsh config
# export ZDOTDIR="$HOME/.config/zsh"

# lazygit
export PATH=~/go/bin:$PATH

# Other
export SPARK_HOME=/Users/dzzxjl/spark/spark-2.2.0-bin-hadoop2.7
export PATH=$SPARK_HOME/bin:$PATH
export SCALA_HOME=/Users/dzzxjl/spark/scala-2.12.3
export PATH=$PATH:$SCALA_HOME/bin

# export PYSPARK_DRIVER_PYTHON=ipython
export PYSPARK_DRIVER_PYTHON=python3
export PYSPARK_DRIVER_PYTHON_OPTS='notebook' pyspark

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# export LANG=zh_CN.UTF-8
# export TERM=xterm-256color

# export HISTTIMEFORMAT="%d/%m/%y %T "

# export LD_LIBRARY_PATH=/usr/local/cuda/lib
# export PATH=$PATH:/usr/local/cuda/bin

# export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

