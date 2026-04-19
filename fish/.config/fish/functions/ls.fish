function ls --wraps=eza --description 'List with eza'
    eza --icons=always --group-directories-first $argv
end
