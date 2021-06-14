#Author: Varun Bardwaj!
PROMPT='${host_status}$(get_pwd)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[028]%}"

ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[178]%}x"

ZSH_THEME_GIT_PROMPT_CLEAN=""

host_status="%(?:%{$BG[032]$FG[233]%} $(hostname) "

prompt_prefix1="%(?:%{$BG[234]$FG[255]%}─❂─"

prompt_prefix2="%(?:%{$BG[234]$FG[167]%} ▶ "

cursor="%(?:%{$BG[234]$FG[247]%}\e[3 q"

prompt_dateNtime="%(?:%{$BG[234]$FG[024]%} [%D{%d-%m-%y}|%T]"

function get_pwd(){

  cwd=$PWD

  symbol=${prompt_prefix1};

  parent=${cwd%\/*}

  prompt_short_dir="%(?:%{$BG[172]$FG[233]%} ${PWD#$parent/} ${prompt_dateNtime}${prompt_prefix2}${cursor}"
  
  prompt_short_dir1="%(?:%{$BG[172]$FG[233]%} ${PWD#$parent/}"

  if [[ $(git_prompt_info) ]] then

    ref="$(git symbolic-ref HEAD | cut -d'/' -f3)"

    info="%(?:%{$BG[034]$FG[233]%} $ref"

    echo $symbol$prompt_short_dir1 $symbol$info ${prompt_dateNtime}$prompt_prefix2${cursor}

  else

    echo $symbol$prompt_short_dir 

  fi
    
}