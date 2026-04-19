function lt --wraps eza --description 'Tree view with eza'
    set -l depth 2

    # Check if user passed -L flag
    if contains -- -L $argv
        eza --tree --icons=always $argv
    else
        eza --tree --icons=always -L $depth $argv
    end
end
