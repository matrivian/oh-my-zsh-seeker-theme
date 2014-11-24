function _virtualenv_prompt_info {
    [[ -n $(virtualenv_prompt_info) ]] && virtualenv_prompt_info
}

function _git_prompt_info {
    [[ -n $(git_prompt_info) ]] && git_prompt_info
}

function _hg_prompt_info {
    [[ -n $(hg_prompt_info) ]] && hg_prompt_info
}

PYENV_PROMPT_DEFAULT_VERSION=${PYENV_PROMPT_DEFAULT_VERSION:="system"}

function _pyenv_prompt_info {
    [[ -n $(pyenv_prompt_info) ]] && \
        [[ "$(pyenv_prompt_info)" != "${PYENV_PROMPT_DEFAULT_VERSION}" ]] && \
        echo "${ZSH_THEME_PYENV_PROMPT_PREFIX}$(pyenv_prompt_info)${ZSH_THEME_PYENV_PROMPT_SUFFIX}"
}

function _rbenv_prompt_info {
  [[ -n $(rbenv_prompt_info) ]] && echo "${ZSH_THEME_RBENV_PROMPT_PREFIX}$(rbenv_prompt_info)${ZSH_THEME_RBENV_PROMPT_SUFFIX}"
}

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo $; fi
}

PROMPT='%(?, ,%{$fg[red]%}FAIL%{$reset_color%}
)
%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%} $(_virtualenv_prompt_info)$(_pyenv_prompt_info)$(_rbenv_prompt_info)$(_git_prompt_info)$(_hg_prompt_info) % %{$reset_color%}
$(prompt_char) '

RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'

ZSH_THEME_HG_PROMPT_PREFIX="%{$fg_bold[red]%}hg:‹%{$fg[magenta]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg_bold[red]%}› %{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_HG_PROMPT_CLEAN="%{$fg_bold[red]%}›"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}git:‹%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}› %{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[red]%}›"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg_bold[red]%}venv:‹%{$fg[magenta]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="%{$fg_bold[red]%}›%{$reset_color%} "

ZSH_THEME_PYENV_PROMPT_PREFIX="%{$fg_bold[red]%}python:‹%{$fg[magenta]%}"
ZSH_THEME_PYENV_PROMPT_SUFFIX="%{$fg_bold[red]%}›%{$reset_color%} "

ZSH_THEME_RBENV_PROMPT_PREFIX="%{$fg_bold[red]%}rbenv:‹%{$fg[magenta]%}"
ZSH_THEME_RBENV_PROMPT_SUFFIX="%{$fg_bold[red]%}›%{$reset_color%} "
