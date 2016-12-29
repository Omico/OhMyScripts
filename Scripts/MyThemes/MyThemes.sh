#!/bin/bash
#By Yuwen 20161230 MyThemes
#Version 1.2

echo "MyThemes"
dir_path=$(cd "$(dirname "$0")"; pwd)
echo "当前路径: ${dir_path}"
cd ${dir_path}
echo "开始清理旧文件，请求 ROOT 权限"
sudo rm -rf ${dir_path}/.Flatabulous ${dir_path}/.Flatabulous.zip
sudo rm -rf /usr/share/themes/Flatabulous/
sudo rm -rf ~/.themes/Flatabulous/
echo "正在下载必要组件"
sudo add-apt-repository ppa:snwh/pulp && sudo apt-get update
sudo apt-get install wget
sudo apt-get install paper-icon-theme
sudo apt-get install docky unity-tweak-tool
wget https://github.com/anmoljagetia/Flatabulous/archive/gtk-320.zip -O .Flatabulous.zip
echo "开始安装主题"
unzip ${dir_path}/.Flatabulous.zip -d .Flatabulous
sudo mkdir /usr/share/themes/Flatabulous/
sudo cp -r .Flatabulous/Flatabulous-gtk-320/* /usr/share/themes/Flatabulous/
sudo chmod -R a+x /usr/share/themes/Flatabulous/
sudo rm -rf ${dir_path}/.Flatabulous ${dir_path}/.Flatabulous.zip
echo
echo "安装完成"
echo
echo "开始设置主题，请点击主题然后选中 Flatabulous"
echo "然后点击图标，选择 Paper"
echo -n "Enter继续："
read
nohup unity-tweak-tool > /dev/null 2>&1 &
nohup docky > /dev/null 2>&1 &
echo "使用 Super 键切出搜索框，输入 docky 并启动，按照你的喜好开始设置 docky"
echo "最后自己设置一张喜欢的壁纸就可以使用了"
echo
echo "          This script written by Yuwen"
echo
echo -n "Enter继续："
read
exit