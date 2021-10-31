# PROMPT_COMMAND='echo'
# precmd() { eval "$PROMPT_COMMAND" }

zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

function exists { which $1 &> /dev/null }

function docker_rmi(){
    docker rmi -f $(docker images | grep $1 | awk '{print $3}' | tr '\n' ' ')
}

function docker_rm(){
    docker rm $(docker ps -a | grep -v 'CONTAINER' | awk '{print $1}')
}

function nbtexplorer(){
    DIR='/home/hanasuru/Public/Tools/NBTExplorer'
    RES=$(nohup wine64 "${DIR}/NBTExplorer.exe" $* >/dev/null 2>&1&)    
}

function dnspy(){
    DIR='/home/hanasuru/Public/Tools/dnspy'
    RES=$(nohup wine64 "${DIR}/dnSpy.exe" $* >/dev/null 2>&1&)    
}

function registryexplorer(){
    DIR='/home/hanasuru/Public/Tools/RegistryExplorer'
    wine64 "${DIR}/RegistryExplorer.exe" $* 
}

function hxd(){
    DIR='/home/hanasuru/.wine64/dosdevices/c:/Program Files/HxD'
    RES=$(nohup wine64 "${DIR}/HxD.exe" $* >/dev/null 2>&1&)
}

function ssh_decoder(){
    DIR='/home/hanasuru/Public/Tools/SSH/test'
    ln -s $DIR/* `pwd` 2>/dev/null
    ./ssh_decoder.rb -n 10 $*
}

if exists peco; then
    function peco_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    function peco_select_all_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(cat $HOME/.all_history | cut -c16- | grep . | eval $tac | peco --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh        
    }

    zle -N peco_select_history
    zle -N peco_select_all_history
    bindkey '^R' peco_select_history
    bindkey '^S' peco_select_all_history
fi


function add_path(){
  echo 'export PATH=$PATH:'$1 >> $ZSH/custom/user-defined/export.sh
}


function clean_history(){
    target="${HOME}/.all_history"
    source="${HOME}/.zsh_history"

    eval cat $source >> $target
    eval history -c
}

function tkill(){
    target=$1
    ps aux  |  grep -i $target | grep -v codium |  awk '{print $2}'  |  xargs sudo kill -9
}

function vol {
  vol.py $*
}

function vol3 {
  /home/hanasuru/Public/Tools/volatility3/vol.py $*
}

function thumbcache(){
  DIR="$HOME/Public/Application/CTF/Thumb_viewer"
  eval wine "${DIR}/thumbcache_viewer.exe" $*
}

function bin(){
    if [[ "$#" -ne 1 ]]; then
        perl -lpe '$_=unpack"B*", $_'
    else
        perl -lpe '$_=pack"B*", $_' 
    fi
}

function hex(){
    if [[ "$#" -eq 0 ]]; then
        xxd -p 
    elif [[ "$#" -eq 1 ]]; then
        xxd -r -p
    fi
}

# function python3.9(){
#     if [[ "$#" -eq 0 ]]; then
#         docker run -it --rm python:3.9 
#     elif [[ "$#" -eq 1 ]]; then
#         docker run -it --rm -v "`pwd`/$1":"/tmp/$1" python:3.9 python3 "/tmp/$1"
#     fi
# }

function john() {
  eval /home/hanasuru/Public/Tools/john/run/john $*
}

function wine64() {
 WINEPREFIX=~/.wine64 wine $*
}

function winetricks64() {
 WINEPREFIX=~/.wine64 winetricks $*
}

function scrcpy() {
    xhost + local:docker &>/dev/null
    docker exec -it c26f182cc8a8 sh
    # tmux new-session -d bash -c "docker run -i -t --privileged --restart=always -v /dev/bus/usb:/dev/bus/usb -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY pierlo1/scrcpy:intel sh -c 'adb tcpip 5555; adb connect 192.168.1.155; scrcpy -b 1024'"
}

function filter() {
    awk "f;/^$1$/,/^$2$/" | grep -Pv "^($1)$|^($2)$"
    #awk 'NR>2 {print last} {last=$0}'
}


#function denjib(){
# id=$1;
# scene=$2;
# url="http://dennou-djibril.cdn.dmmgames.com/pp/cocos2d/res/pc/character";
# part=$3;
# offset=$4;
#
# for i in `seq 1 ${offset}`; do wget $(python -c "import sys; a='${url}/${id}/voice/${scene}_scenario_000_00${part}_0{}.mp3'; b=$i; print a.format(str(b).zfill(2))"); done
#}


#if [[ grep -q '192.168.1.30' /etc/resolv.conf ]]; then
#  echo "baka"
#elif

function vncaudio() {
 ssh -C pi@pi2 sox -q -t alsa loop -t wav -b 16 -r 48k - | play -q -
}
