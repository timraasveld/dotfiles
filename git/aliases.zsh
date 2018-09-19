# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias mim='merge_current_branch_into_master'

merge_current_branch_into_master() {
  current_branch=$(git branch | grep \* | cut -d ' ' -f2)
  git checkout master
  git merge --squash master $current_branch
  git commit
}

tub(){ # Temporarily use branch, default master
  set -o xtrace
  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}
  export LAST_USED_BRANCH=$branch_name

  git add -A
  git stash
  git checkout ${1:-master}
}

cw() { # Continue working (on work stashed using tub function)
  set -o xtrace
  git checkout $LAST_USED_BRANCH
  git stash pop
}
