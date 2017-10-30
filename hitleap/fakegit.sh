#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

#=================================================
#	System Required: CentOS/Debian/Ubuntu
#	Description: Fakegit Tools
#	Version: 1.0.0
#	Author: Fakegit
#	Blog: https://github.com/fakegit
#=================================================
sh_ver="1.0.0"
sh_url="https://github.com/fakegit/bash/raw/master/hitleap/fakegit.sh"

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[Info]${Font_color_suffix}"
Error="${Red_font_prefix}[Error]${Font_color_suffix}"
Tip="${Green_font_prefix}[Warn]${Font_color_suffix}"

Update_Shell(){
	echo -e "Current Version [ ${sh_ver} ]，check update..."
	sh_new_ver=$(wget --no-check-certificate -qO- ${sh_url}|grep 'sh_ver="'|awk -F "=" '{print $NF}'|sed 's/\"//g'|head -1)
	[[ -z ${sh_new_ver} ]] && echo -e "${Error} Failed to check update !" && exit 0
	if [[ ${sh_new_ver} != ${sh_ver} ]]; then
		echo -e "Found new update[ ${sh_new_ver} ]，update？[Y/n]"
		stty erase '^H' && read -p "(default: y):" yn
		[[ -z "${yn}" ]] && yn="y"
		if [[ ${yn} == [Yy] ]]; then
			wget -N --no-check-certificate ${sh_url} && chmod +x fakegit.sh
			echo -e "Tools have been updated to the newest version [ ${sh_new_ver} ] !"
		else
			echo && echo "	Cancel..." && echo
		fi
	else
		echo -e "It's already the newest version[ ${sh_new_ver} ] !"
	fi
}

Install_bbr(){
  echo "BBR"
}

3proxy(){
  echo "3proxy"
}

Main(){
  while True; do
    echo && echo -e " Fakegit Tools ${Red_font_prefix}[v${sh_ver}]${Font_color_suffix}
      -- Fakegit | https://github.com/fakegit --
    
     ${Green_font_prefix}0.${Font_color_suffix} Check and update tools
     ${Green_font_prefix}1.${Font_color_suffix} Install bbr
     ${Green_font_prefix}2.${Font_color_suffix} 3proxy
     ${Green_font_prefix}3.${Font_color_suffix} Quit
    " && echo
    echo
    read -p " Please enter number [0-7]:" num
    case "$num" in
      0)
      Update_Shell
      ;;
      1)
      Install_bbr
      ;;
      2)
      3proxy
      ;;
      3)
      echo "exit"
      break
      ;;
      *)
      echo "Please enter right number [0-7]"
      ;;
    esac
  done
}

Main
