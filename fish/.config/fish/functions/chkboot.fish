# ~/.config/fish/functions/chkboot.fish
# Report whether Ubuntu is waiting for a reboot after package updates.

function chkboot --description 'Check if the system needs a reboot'
    if not test -e /var/run/reboot-required
        echo 'No reboot needed.'
        return 1
    end

    echo 'Reboot required.'

    # Packages that asked for the reboot, if the system recorded them.
    if test -r /var/run/reboot-required.pkgs
        sort --unique /var/run/reboot-required.pkgs | string replace --regex '^' '  '
    end
end
