# Alias Name
alias tb='nc termbin.com 9999'
alias fd='fdfind $*'
alias ls='exa --time-style=long-iso -g'
alias ll='ls --git --time-style=long-iso -gl'
alias la='ls --git --time-style=long-iso -agl'
alias l1='exa -1'
alias mkdir='mkdir -p'
alias cmd='wine cmd'
alias powershell='pwsh'
alias alias-edit='vim ~/.oh-my-zsh/custom/user-defined/alias.sh'
alias tb='nc termbin.com 9999'
alias code='codium $*'

alias ctfd='ctfd $* 2>/dev/null'
alias vlc='/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=/app/bin/vlc --file-forwarding org.videolan.VLC'

alias cctv1='vlc rtsp://admin:a12345678@192.168.1.19:554/Streaming/Channels/101 &>/dev/null'
alias cctv2='vlc rtsp://admin:a12345678@192.168.1.19:554/Streaming/Channels/301 &>/dev/null'

# Minecraft server
#alias minecraft_start='az vm start -g ubuntu_group -n ubuntu'
#alias minecraft_stop='az vm stop -g ubuntu_group -n ubuntu'
#alias minecraft_restart='az vm restart -g ubuntu_group -n ubuntu'
#alias minecraft_deallocate='az vm deallocate -g ubuntu_group -n ubuntu'

alias np='notepadqq $*'
alias autopsy='autopsy --nosplash'
alias xmlpretty='xmllint --format - | bat -l xml'

#alias exiftool='/home/hanasuru/Public/AppCheck/exiftool/exiftool'
#alias filter="awk 'f;/Node 1/,/=/' |  grep -Ev '=|Node'"
