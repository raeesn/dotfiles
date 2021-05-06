export GOROOT=/usr/local/go
export GOPATH=~/.go
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export GRADLE_HOME=/opt/gradle-6.8.2
source $HOME/.cargo/env
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$GRADLE_HOME/bin
export CARGO_TARGET_DIR=~/.cargo/target

