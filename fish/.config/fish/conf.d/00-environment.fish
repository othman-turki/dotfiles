# ~/.config/fish/conf.d/00-environment.fish
# PATH entries and environment variables.

# Make locally installed tools available.
fish_add_path --global ~/.local/bin

# Default editor for Git and other command-line tools.
set --global --export EDITOR nano

# fzf: Catppuccin Mocha colors.
set --global --export FZF_DEFAULT_OPTS \
    '--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8' \
    '--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc' \
    '--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8' \
    '--color=selected-bg:#45475a' \
    '--color=border:#6c7086,label:#cdd6f4'

# fzf: use fd for speed and .gitignore support.
set --global --export FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set --global --export FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set --global --export FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'
