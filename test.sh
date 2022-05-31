#!/usr/bin/env bash

##### 为 macOS 添加 WGCF，IPv4走 warp #####
# 当前脚本版本号和新增功能
VERSION=1.00

E[0]="\n Language:\n  1.English (default) \n  2.简体中文\n"
C[0]="${T[E0]}"
E[1]="First publication on a global scale: WARP one-click script on macOS. A VPN that fast,modern,secure by WireGuard tunnel and WARP service"
C[1]="全网首发: macOS 一键脚本， 一个为免费、快速、安全的基于 WireGuard 隧道，WARP 服务的 VPN"
E[2]="The script must be run as root, you can enter sudo -i and then download and run again. Feedback: [https://github.com/fscarmen/warp/issues]"
C[2]="必须以root方式运行脚本，可以输入 sudo -i 后重新下载运行，问题反馈:[https://github.com/fscarmen/warp/issues]"
E[3]="Choose:"
C[3]="请选择:"
E[4]="WARP have been completely deleted!"
C[4]="WARP 已彻底删除!"
E[5]="The script supports macOS only. Feedback: [https://github.com/fscarmen/warp/issues]"
C[5]="本脚本只支持 macOS, 问题反馈:[https://github.com/fscarmen/warp/issues]"
E[6]="If there is a WARP+ License, please enter it, otherwise press Enter to continue:"
C[6]="如有 WARP+ License 请输入，没有可回车继续:"
E[7]="Input errors up to 5 times.The script is aborted."
C[7]="输入错误达5次，脚本退出"
E[8]="License should be 26 characters, please re-enter WARP+ License. Otherwise press Enter to continue. \(\${i} times remaining\):"
C[8]="License 应为26位字符，请重新输入 WARP+ License，没有可回车继续\(剩余\${i}次\):"
E[9]="Please customize the WARP+ device name (Default is [WARP] if left blank):"
C[9]="请自定义 WARP+ 设备名 (如果不输入，默认为 [WARP]):"
E[10]="Step 1/3: Install brew and wireguard-tools"
C[10]="进度 1/3：安装 brew 和 wireguard-tools"
E[11]="Step 2/3: Install WGCF and wireguard-go"
C[11]="进度 2/3：安装 WGCF 和 wireguard-go"
E[12]="Step 3/3: Running WARP"
C[12]="进度 3/3：运行 WARP"
E[13]="Update WARP+ account..."
C[13]="升级 WARP+ 账户中……"
E[14]="The upgrade failed, WARP+ account error or more than 5 devices have been activated. Free WARP account to continu."
C[14]="升级失败，WARP+ 账户错误或者已激活超过5台设备，自动更换免费 WARP 账户继续"
E[15]="Congratulations! WARP\$TYPE is turned on. Spend time:\$(( end - start )) seconds.\\\n The script runs today: \$TODAY. Total:\$TOTAL"
C[15]="恭喜！WARP\$TYPE 已开启，总耗时:\$(( end - start ))秒， 脚本当天运行次数:\$TODAY，累计运行次数：\$TOTAL"
E[16]="Congratulations! WARP is turned on. Spend time:\$(( end - start )) seconds.\\\n The script runs on today: \$TODAY. Total:\$TOTAL"
C[16]="恭喜！WARP 已开启，总耗时:\$(( end - start ))秒， 脚本当天运行次数:\$TODAY，累计运行次数：\$TOTAL"
E[17]="Device name：\$(grep -s 'Device name' /etc/wireguard/info.log | awk '{ print \$NF }')\\\n Quota：\$(grep -s Quota /etc/wireguard/info.log | awk '{ print \$(NF-1), \$NF }')"
C[17]="设备名:\$(grep -s 'Device name' /etc/wireguard/info.log | awk '{ print \$NF }')\\\n 剩余流量:\$(grep -s Quota /etc/wireguard/info.log | awk '{ print \$(NF-1), \$NF }')"
E[18]="Run again with warp [option], such as"
C[18]="再次运行用 warp [option]，如"
E[19]="WARP installation failed. Feedback: [https://github.com/fscarmen/warp/issues]"
C[19]="WARP 安装失败，问题反馈:[https://github.com/fscarmen/warp/issues]"
E[20]="warp h (help)\n warp o (WARP on-off)\n warp u (Turn off and uninstall WARP interface)\n warp a (Upgrade to WARP+ or Teams account)\n warp e (Install WARP in English)\n warp c (Install WARP in Chinese)\n warp v (Sync the latest version)"
C[20]="warp h (帮助菜单）\n warp o (临时warp开关)\n warp u (卸载 WARP )\n warp a (免费 WARP 账户升级 WARP+ 或 Teams)\n warp e (英文安装 WARP )\n warp c (中文安装 WARP )\n warp v (同步脚本至最新版本)"
E[21]="WGCF WARP has not been installed yet."
C[21]="WGCF WARP 还未安装"
E[22]="WARP is turned off. It could be turned on again by [warp o]"
C[22]="已暂停 WARP，再次开启可以用 warp o"
E[23]="WireGuard tools are not installed or the configuration file wgcf.conf cannot be found, please reinstall."
C[23]="没有安装 WireGuard tools 或者找不到配置文件 wgcf.conf，请重新安装。"
E[24]="Maximum \${j} attempts to get WARP IP..."
C[24]="后台获取 WARP IP 中,最大尝试\${j}次……"
E[25]="Try \${i}"
C[25]="第\${i}次尝试"
E[26]="Got the WARP IP successfully."
C[26]="已成功获取 WARP 网络"
E[27]="Create shortcut [bash warp] successfully"
C[27]="创建快捷 bash warp 指令成功"
E[28]="Successfully synchronized the latest version"
C[28]="成功！已同步最新脚本，版本号"
E[29]="New features"
C[29]="功能新增"
E[30]="Upgrade failed. Feedback:[https://github.com/fscarmen/warp/issues]"
C[30]="升级失败，问题反馈:[https://github.com/fscarmen/warp/issues]"
E[31]="WARP+ or Teams account is working now. No need to upgrade."
C[31]="已经是 WARP+ 或者 Teams 账户，不需要升级"
E[32]="Cannot find the account file: /etc/wireguard/wgcf-account.toml, you can reinstall with the WARP+ License"
C[32]="找不到账户文件：/etc/wireguard/wgcf-account.toml，可以卸载后重装，输入 WARP+ License"
E[33]="Cannot find the configuration file: /etc/wireguard/wgcf.conf, you can reinstall with the WARP+ License"
C[33]="找不到配置文件： /etc/wireguard/wgcf.conf，可以卸载后重装，输入 WARP+ Licens"
E[34]="\n 1.Update with WARP+ license\n 2.Update with Teams (You need upload the Teams file to a private storage space before. For example: gist.github.com)\n"
C[34]="\n 1.使用 WARP+ license 升级\n 2.使用 Teams 升级 (你须事前把 Teams 文件上传到私密存储空间，比如：gist.github.com )\n"
E[35]="Successfully upgraded to a WARP+ account"
C[35]="已升级为 WARP+ 账户"
E[36]="Device name"
C[36]="设备名"
E[37]="WARP+ quota"
C[37]="剩余流量"
E[38]="The upgrade failed, WARP+ account error or more than 5 devices have been activated. Free WARP account to continu."
C[38]="升级失败，WARP+ 账户错误或者已激活超过5台设备，自动更换免费 WARP 账户继续"
E[39]="Successfully upgraded to a WARP Teams account"
C[39]="已升级为 WARP Teams 账户"
E[40]="Please enter the correct number"
C[40]="请输入正确数字"
E[41]="Please Input WARP+ license:"
C[41]="请输入WARP+ License:"
E[42]="License should be 26 characters, please re-enter WARP+ License. Otherwise press Enter to continue. \(\${i} times remaining\): "
C[42]="License 应为26位字符,请重新输入 WARP+ License \(剩余\${i}次\): "
E[43]="Please customize the WARP+ device name (Default is [WARP] if left blank):"
C[43]="请自定义 WARP+ 设备名 (如果不输入，默认为 [WARP]):"
E[44]="Please input Teams file URL (To use the one provided by the script if left blank):" 
C[44]="请输入 Teams 文件 URL (如果留空，则使用脚本提供的):"
E[45]="( match √ )"
C[45]="( 符合 √ )"
E[46]="( mismatch X )"
C[46]="( 不符合 X )"
E[47]="\\\n Please confirm\\\n Private key\\\t: \$PRIVATEKEY \$MATCH1\\\n Public key\\\t: \$PUBLICKEY \$MATCH2\\\n Address IPv4\\\t: \$ADDRESS4/32 \$MATCH3\\\n Address IPv6\\\t: \$ADDRESS6/128 \$MATCH4\\\n"
C[47]="\\\n 请确认Teams 信息\\\n Private key\\\t: \$PRIVATEKEY \$MATCH1\\\n Public key\\\t: \$PUBLICKEY \$MATCH2\\\n Address IPv4\\\t: \$ADDRESS4/32 \$MATCH3\\\n Address IPv6\\\t: \$ADDRESS6/128 \$MATCH4\\\n"
E[48]="comfirm please enter [y] , and other keys to use free account:"
C[48]="确认请按 y ，其他按键则使用免费账户:"
E[49]="\n Is there a WARP+ or Teams account?\n 1. WARP+\n 2. Teams\n 3. use free account (default)\n"
C[49]="\n 如有 WARP+ 或 Teams 账户请选择\n 1. WARP+\n 2. Teams\n 3. 使用免费账户 (默认)\n"
E[50]="If there is a WARP+ License, please enter it, otherwise press Enter to continue:"
C[50]="如有 WARP+ License 请输入，没有可回车继续:"
E[51]="License should be 26 characters, please re-enter WARP+ License. Otherwise press Enter to continue. \(\${i} times remaining\):"
C[51]="License 应为26位字符，请重新输入 WARP+ License，没有可回车继续\(剩余\${i}次\):"
E[52]="There have been more than \${j} failures. The script is aborted. Feedback: [https://github.com/fscarmen/warp/issues]"
C[52]="失败已超过\${j}次，脚本中止，问题反馈:[https://github.com/fscarmen/warp/issues]"

# 自定义字体彩色，read 函数，友道翻译函数
red(){ echo -e "\033[31m\033[01m$1\033[0m"; }
green(){ echo -e "\033[32m\033[01m$1\033[0m"; }
yellow(){ echo -e "\033[33m\033[01m$1\033[0m"; }
reading(){ read -rp "$(green "$1")" "$2"; }
translate(){ [[ -n "$1" ]] && curl -ksm8 "http://fanyi.youdao.com/translate?&doctype=json&type=AUTO&i=${1//[[:space:]]/}" | cut -d \" -f18 2>/dev/null; }

# 脚本当天及累计运行次数统计
statistics_of_run-times(){
COUNT=$(curl -ksm1 "https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fcdn.jsdelivr.net%2Fgh%2Ffscarmen%2Fwarp%2Fmenu.sh&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=&edge_flat=true" 2>&1) &&
TODAY=$(expr "$COUNT" : '.*\s\([0-9]\{1,\}\)\s/.*') && TOTAL=$(expr "$COUNT" : '.*/\s\([0-9]\{1,\}\)\s.*')
}
	
# 选择语言，先判断 /etc/wireguard/language 里的语言选择，没有的话再让用户选择，默认英语
L=("${E[@]}") && [[ -z $OPTION ]] && yellow " ${L[0]} " && reading " ${L[3]} " LANGUAGE 
[[ $LANGUAGE = 2 ]] && L=("${C[@]}")

echo "${L[5]}"