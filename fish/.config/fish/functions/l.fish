# ~/.config/fish/functions/l.fish
# List files with eza.

function l --wraps eza --description 'List with eza'
    eza --icons=auto --group-directories-first $argv
end
