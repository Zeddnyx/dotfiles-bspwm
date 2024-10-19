function fish_greeting
fastfetch
alias vi=nvim
alias ga="git add $1"
alias gc="git commit -m $1"
alias gs="git status --short"
alias gpl="git pull origin $1"
alias gck="git checkout $1"
alias grs="git remote set-url origin $1"
alias gpush="git push origin $1"
alias gpull="git pull origin $1"
alias scr="$HOME/Notes/scr.sh"
alias work="npm run dev"
alias huhuy="npm run format && ga . && git commit -m $1"
alias test-vuln="trivy fs --scanners vuln --include-dev-deps --format json ./ > scan-trivy.json"

if status is-interactive
and not set -q TMUX
  exec tmux
end
end
