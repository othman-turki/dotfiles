# ~/.config/fish/config.fish
# Entry point for the fish configuration.
#
# Settings live in conf.d/ and functions live in functions/.
# Add anything here only if it must run after conf.d/.

status is-interactive; or return

# Directory jumping: z <name>, or zi for interactive selection.
if type --query zoxide
    zoxide init fish | source
end
