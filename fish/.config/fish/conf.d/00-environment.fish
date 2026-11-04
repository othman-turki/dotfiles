# ~/.config/fish/conf.d/00-environment.fish
# PATH entries and environment variables.

# Make locally installed tools available.
fish_add_path --global ~/.local/bin

# Default editor for Git and other command-line tools.
set --global --export EDITOR nano
