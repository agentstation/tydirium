#!/bin/bash
# Bash completion for tydirium
# Installation: source this file or add to ~/.bashrc

_tydirium() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="-q -v -h -V"

    # If previous word is tydirium, offer options or domains
    if [[ ${prev} == "tydirium" ]]; then
        if [[ ${cur} == -* ]]; then
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        else
            # Suggest common domains from history or examples
            local domains="example.com gmail.com yahoo.com outlook.com"
            COMPREPLY=( $(compgen -W "${domains}" -- ${cur}) )
        fi
        return 0
    fi

    # If current word starts with -, offer options
    if [[ ${cur} == -* ]]; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi

    # Otherwise, suggest domains
    if [[ ${prev} == "-q" ]] || [[ ${prev} == "-v" ]]; then
        local domains="example.com gmail.com yahoo.com outlook.com"
        COMPREPLY=( $(compgen -W "${domains}" -- ${cur}) )
    fi
}

complete -F _tydirium tydirium