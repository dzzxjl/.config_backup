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
