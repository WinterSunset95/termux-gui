#!/data/data/com.termux/files/usr/bin

end="\e[0m"
red="\e[31m"
green="\e[32m"
yellow="\e[33m"
cyan="\e[36m"

dir=$(pwd)

printf "${red}\n\n\tInstalling required packages...\n\n${end}"
pkg update && pkg upgrade
pkg install x11-repo
pkg install tigervnc openbox xfce4-panel xcompmgr aterm feh

printf "${red}\n\n\t\tVncserver setup\n\n${end}"
vncserver
vncserver -kill :1
cd ~/.vnc/
{ 
	rm -rf config xstartup
	ln -sf $dir/xstartup
	printf "${yellow}Creating symbolic link to xstartup${end}"
	printf "${cyan}\nDone!${end}"
	ln -sf $dir/config
	printf "${yellow}\n\nCreating symbolic link to config${end}"
	printf "${cyan}\nDone!${end}"
} || {
	ln -sf $dir/xstartup
	printf "${yellow}Creating symbolic link to xstartup${end}"
	printf "${cyan}\nDone!${end}"
	ln -sf $dir/config
	printf "${yellow}\n\nCreating symbolic link to config${end}"
	printf "${cyan}\nDone!${end}"

}


printf "${red}\n\n\t\tOpenbox and Xfce4 panel\n\n${end}"
cd /data/data/com.termux/files/usr/etc/xdg

{ 
	rm -rf openbox xfce4 menus
	ln -sf $dir/openbox
	printf "${yellow}Creating symbolic link to openbox${end}"
	printf "${cyan}\nDone!${end}"
	ln -sf $dir/xfce4 
	printf "${yellow}\n\nCreating symbolic link to xfce4${end}"
	printf "${cyan}\nDone!${end}"
	ln -sf $dir/menus 
	printf "${yellow}\n\nCreating symbolic link to menus${end}"
	printf "${cyan}\nDone!${end}"
} || {
	ln -sf $dir/openbox
	printf "${yellow}Creating symbolic link to openbox${end}"
	printf "${cyan}\nDone!${end}"
	ln -sf $dir/xfce4 
	printf "${yellow}\n\nCreating symbolic link to xfce4${end}"
	printf "${cyan}\nDone!${end}"
	ln -sf $dir/menus 
	printf "${yellow}\n\nCreating symbolic link to menus${end}"
	printf "${cyan}\nDone!${end}"

}

