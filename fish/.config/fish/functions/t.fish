# ~/.config/fish/functions/t.fish
# Show a directory tree, two levels deep unless a depth is given.

function t --wraps eza --description 'Tree view with eza'
    if contains -- -L $argv; or contains -- --level $argv
        eza --tree --icons=auto $argv
    else
        eza --tree --icons=auto --level=2 $argv
    end
end
