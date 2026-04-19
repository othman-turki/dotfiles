# ~/.config/fish/config.fish
# Fish shell configuration for interactive sessions.

if status is-interactive
    # Disable default greeting (fastfetch will replace it later)
    set -g fish_greeting ""

    # Prompt — starship with Catppuccin Mocha, config at ~/.config/starship.toml
    starship init fish | source

    # Navigation — zoxide (use `z <name>` or `zi` for interactive)
    zoxide init fish | source

    # atuin — owns Ctrl+R for history search, up arrow disabled
    atuin init fish --disable-up-arrow | source

    # Fuzzy finder — fzf (Ctrl+T files, Alt+C cd — atuin owns Ctrl+R)
    fzf --fish | source
    bind ctrl-r _atuin_search
    bind -M insert ctrl-r _atuin_search

    # fzf uses fd for speed and .gitignore awareness
    set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"
    set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
    set -gx FZF_ALT_C_COMMAND  "fd --type d --hidden --follow --exclude .git"
end
