FROM centos:7

# Installs
run yum install gcc -y
run yum install python-devel -y
run yum install wget -y
run yum install tar -y
run yum install git -y
run yum install make -y
run wget http://mercurial.selenic.com/release/mercurial-3.2.4.tar.gz
run tar zxvf mercurial-3.2.4.tar.gz
run cd mercurial-3.2.4 && make install-bin

# golang
run cd $HOME && hg clone https://code.google.com/p/go && cd go && hg update release
run cd $HOME/go/src && ./all.bash

# settings
run echo 'export PATH=$PATH:/home/vagrant/go/bin' >> $HOME/.bash_profile
run echo 'export GOROOT=$HOME/go' >> $HOME/.bash_profile
run echo 'export GOPATH=$GOROOT/bin' >> $HOME/.bash_profile

# sshd追加すべきでないかな
# run echo 'root:root' |chpasswd
# expose 22

# TODO
# サーバ関連のものを追加
# golangのサーバ系のモジュールとかを追加


