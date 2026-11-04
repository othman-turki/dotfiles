# ~/.config/fish/functions/ll.fish
# List all files in long format with Git status.

function ll --wraps eza --description 'Long list with eza'
    eza --long --all --icons=auto --group-directories-first --git $argv
end
