# ~/.config/fish/functions/la.fish
# List all files, including hidden ones, with eza.

function la --wraps eza --description 'List all files with eza'
    eza --all --icons=auto --group-directories-first $argv
end
