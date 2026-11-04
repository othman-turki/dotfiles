# ~/.config/fish/functions/fish_greeting.fish
# Show system information when a new terminal opens.

function fish_greeting --description 'Display system information'
    # Keep the VS Code terminal clean.
    test "$TERM_PROGRAM" = vscode; and return

    fastfetch
end
