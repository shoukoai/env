#PROMPT_COMMAND='echo'
#precmd() { eval "$PROMPT_COMMAND" }

if [[ $UID -eq 0 ]]; then
    PROMPT=$'%{$fg_bold[blue]%}╭─%{$fg_bold[white]%}« %{$fg_bold[green]%}%n%{$fg_bold[white]%} ⚡ : %{$fg[blue]%}%B%c/%b%{$reset_color%} 
%{$fg_bold[white]%}╰─%{$fg_bold[blue]%}» %{$reset_color%}'
else
    PROMPT=$'%{$fg_bold[blue]%}╭─%{$fg_bold[white]%}« %{$fg_bold[green]%}%n%{$fg_bold[white]%} : %{$fg[blue]%}%B%c/%b%{$reset_color%}  
%{$fg_bold[white]%}╰─%{$fg_bold[blue]%}» %{$reset_color%}'
fi


#RPS1=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[white]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ✗"
