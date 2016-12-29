#!/bin/bash
#By Yuwen 20161215 InstallVSCode
#Version 1.0
LOCAL_USER=$( whoami )
HOST_OS=$( uname )

download_url(){
    echo "https://vscode-update.azurewebsites.net/latest/$1/stable"
}

check_linux_release(){
    if [[ -f /etc/redhat-release ]]; then
        PACKAGE="rpm"
    elif cat /etc/issue | grep -q -E -i "debian"; then
        PACKAGE="deb"
    elif cat /etc/issue | grep -q -E -i "ubuntu"; then
        PACKAGE="deb"
    elif cat /etc/issue | grep -q -E -i "centos | red hat | redhat"; then
        PACKAGE="rpm"
    elif cat /proc/version | grep -q -E -i "debian"; then
        PACKAGE="deb"
    elif cat /proc/version | grep -q -E -i "ubuntu"; then
        PACKAGE="deb"
    elif cat /proc/version | grep -q -E -i "centos | red hat | redhat"; then
        PACKAGE="rpm"
    fi
}

wget_vscode_package(){
    wget $( download_url "$VERSION" ) -O "$1"
}

clear
if [ "$HOST_OS" = "Linux" ]; then
    OS="linux"
    check_linux_release
    OS_BIT=$( getconf LONG_BIT )
    VERSION="$OS"-"$PACKAGE"-"x$OS_BIT"
    wget_vscode_package ".vscode.$PACKAGE"
    if [ -f ".vscode.deb" ]; then
        echo "开始安装，需要 ROOT 权限"
        sudo dpkg -i ".vscode.deb"
    elif [ -f ".vscode.rpm" ]; then
        sudo rpm -ivh ".vscode.rpm"
    fi
    rm ".vscode.$PACKAGE"
    echo "安装完成，终端运行 code 开始使用"
elif [ "$HOST_OS" = "Darwin" ]; then
    VERSION="darwin"
    wget_vscode_package "vscode.zip"
    unzip vscode.zip -d "/Users/$LOCAL_USER/Desktop/"
    rm vscode.zip
    echo "vscode 已下载到桌面"
fi
read