#把刚才复制的那一串长长的命令想办法搞进一个Linux系统里。
#它应该长得像这样：
#curl 'https://www.google.com/voice/b/1/service/post' ……………… --compressed
#之后的步骤要分情况讨论：
#1.你有一个位于美国的VPS/独立服务器/云主机……
#2.你没有。
#如果是情况1，你不需要修改这个命令的任何一部分。
#但如果是情况2，你就需要使用一个位于美国的代理。
#（此处不提供代理/SS/SSR之类的教程，谷歌一下，你很快就会知道的）
#在刚才的命令后面附加一个选项，像这样：
#-x [http（对于HTTP代理）/https（对于HTTPS代理）/socks4（对于Socks4代理）/socks4a（对于Socks4a代理）/socks5h（对于Socks5代理，不要删掉h否则会出现奇怪的问题）]://[代理服务器域名]:[端口号]
#加完之后的命令应该长得像这样：
#curl 'https://www.google.com/voice/b/1/service/post' ……………… --compressed -x xxxx://example.com:xxxx
#上面的步骤在情况2下做，情况1下不需要。
#之后，把这个命令套进这样一个脚本的模板里：


#!/bin/bash
#请注意使用UTF-8 without BOM格式，否则可能会出错
#脚本 by Sunbread
########## Setting ##########
threads=16 # 根据自身情况调整，若不会调整则按默认值即可
########## Code ##########
echo 伪多线程脚本 by Sunbread
for((i=0;i<$threads;++i));do while :;do
    [curl ...] >/dev/null 2>/dev/null
    # 用刚才的命令替换中括号里的内容（包括两个中括号本身）
done &
done
echo 结束脚本请使用Ctrl+C，使用其它方法可能会出现无法预料的异常，谢谢合作
wait
