# open firefox/chrome
# go to http://voice.google.com
# visit legacy google voice
# click add new number
# open inspect, go to network option
# select a number and click continue
# find the request from the network option panel, right click, choose "copy as curl"
# find result=$(replace it with the above copy), replace and save
# run "bash gv.sh &"

contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}

while true; do
    result=$(curl -s 'https://www.google.com/voice/b/0/service/post' -H 'origin: https://www.google.com' ... --compressed)
    contains "$result" "error" || exit 0
    sleep 1.5
done
