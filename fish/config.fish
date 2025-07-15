if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias projects="cd ~/Documents/projects"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ll="eza -lh"
alias l="eza -lah"
alias cd="z"

function git_current_branch
    git rev-parse --abbrev-ref HEAD
end

# Git Aliases
alias g="git"
alias ga="git add"
alias gaa="git add -Av"
alias gap="git add -p"
alias gb="git branch"
alias gbd="git branch --delete"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gc="git commit --verbose -S -m"
alias gm="git merge"
alias gpl="git pull"
alias gp="git push"
alias gpsup="git push --set-upstream origin (git_current_branch)"
alias gr="git remote"
alias grv="git remote --verbose"
alias gst="git status"
alias gsw="git switch"
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold red)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'"
alias gla="gl --all"
alias gd="git diff"
alias gdd="git diff --cached"
alias gs="git stash"
alias grs 'git reset --soft'
alias grm 'git reset --mixed'
alias grh 'git reset --hard'

# Kill port
function killport
    if test (count $argv) -eq 0
        echo "Usage: killport <port>"
        return 1
    end

    set pid (lsof -i tcp:$argv[1] | awk 'NR!=1 {print $2}')
    if test -n "$pid"
        echo "Killing process $pid on port $argv[1]"
        echo $pid | xargs kill
    else
        echo "No process found on port $argv[1]"
    end
end

eval "$(/opt/homebrew/bin/brew shellenv)"
set -gx HOMEBREW_NO_AUTO_UPDATE 1
zoxide init fish | source
starship init fish | source
