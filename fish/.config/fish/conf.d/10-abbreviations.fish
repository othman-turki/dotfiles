# ~/.config/fish/conf.d/10-abbreviations.fish
# Command shortcuts for interactive sessions.

status is-interactive; or return

# Navigation
abbr --add ... 'cd ../..'

# Git
abbr --add gs 'git status'
abbr --add ga 'git add'
abbr --add gc 'git commit'
abbr --add gp 'git push'
abbr --add gl 'git pull'
abbr --add gd 'git diff'
