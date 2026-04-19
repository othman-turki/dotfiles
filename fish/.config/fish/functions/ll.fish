function ll --wraps eza --description 'Long list with eza'
    eza -la --icons=always --group-directories-first --git $argv
end
