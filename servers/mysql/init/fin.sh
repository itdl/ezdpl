#!/bin/bash
# MySQL for ubuntu not finished...

source /usr/local/bin/release.include
echo $_RELEASE
mkdir -p /data/mysql
mkdir -p /data/backup

case $_RELEASE in
    CENTOS6|CENTOS7)
	if [[ $_RELEASE = CENTOS6 ]]; then
    	    rpm -ivh https://repo.mysql.com/mysql57-community-release-el6.rpm
        elif [[ $_RELEASE = CENTOS7 ]]; then
    	    rpm -ivh https://repo.mysql.com/mysql57-community-release-el7.rpm
	fi
	read -p "Now edit mysql repo file....[Enter]"
	if [[ -f /etc/yum.repos.d/mysql-community.repo ]]; then
    	    vim /etc/yum.repos.d/mysql-community.repo
	fi

	for x in `ps aux|grep -i 'yum' |grep -v grep|awk '{print $2}'`; do
    		kill $x || kill -9 $x
	done
	yum clean all
	rpmkeys --import https://repo.mysql.com/RPM-GPG-KEY-mysql
	echo "Installing mysql-server..."
	yum install -y mysql-community-server
	mv /etc/my.cnf files/etc/my.cnf.org
	mv /etc/my.cnf.new /etc/my.cnf
	chkconfig mysqld on
	service start mysqld
	mysql_secure_installation
	;;
    UBUNTU)
	sudo dpkg -i https://repo.mysql.com/mysql-apt-config_0.8.7-1_all.deb
	if [[ -f /etc/apt/sources.list.d/mysql.list ]]; then
	    echo ""
	fi
	;;
esac
