# ~/.config/fish/conf.d/10-abbreviations.fish
# Command shortcuts for interactive sessions.

status is-interactive; or return

# Navigation
abbr --add ... 'cd ../..'

# Typed cd and ls become z and l. Abbreviations expand only at the prompt,
# so scripts and other tools still get the real commands.
if type --query zoxide
    abbr --add cd z
end
if type --query eza
    abbr --add ls l
end

# Git
abbr --add gs 'git status'
abbr --add ga 'git add'
abbr --add gc 'git commit'
abbr --add gp 'git push'
abbr --add gl 'git pull'
abbr --add gd 'git diff'
