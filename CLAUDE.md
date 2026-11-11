# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). The repo lives at `~/dotfiles`, so Stow's default target (the parent directory) is `$HOME`. There is no build, lint, or test step.

The target machine runs Ubuntu with GNOME. Some files depend on that, such as `chkboot` (reads `/var/run/reboot-required`) and the Ghostty keybinds.

## Commands

Run from the repo root:

```sh
stow <package>        # symlink a package into $HOME (e.g. stow fish)
stow -R <package>     # restow: needed after adding, renaming, or removing files
stow -D <package>     # remove a package's symlinks
stow -n -v <package>  # dry run, shows what would be linked
```

Checking a change:

```sh
fish --no-execute <file>.fish   # syntax-check a fish file
exec fish                       # reload the shell config
ghostty +validate-config        # validate the Ghostty config
```

## Layout

Each top-level directory is a Stow package whose contents mirror their path relative to `$HOME`, e.g. `fish/.config/fish/config.fish` becomes `~/.config/fish/config.fish`.

`.stowrc` sets `--no-folding`: Stow creates real directories and symlinks each file individually, never a whole directory. Two consequences:

- A new file in a package is not live until the package is restowed (`stow -R`). Edits to existing files are live immediately, since they are symlinks back into this repo.
- Target directories such as `~/.config/fish/` can hold untracked machine-local files (e.g. `completions/`) next to the stowed ones. Do not assume everything there belongs to this repo.

Packages are stowed one at a time, so a package being in the repo does not mean it is linked. `atuin`, for example, is currently not stowed. Run `stow -n -v <package>` to check before assuming a config is live.

## Conventions

**Theme.** Everything uses Catppuccin Mocha: Ghostty's `theme`, the Starship `palette`, the fzf colors in `FZF_DEFAULT_OPTS`, and the eza and atuin theme files. Keep new tool configs on the same palette.

**Accent variants.** `eza/` and `atuin/` each ship all 14 Catppuccin Mocha accent variants as upstream files. For eza, the active theme is `theme.yml`, a copy of one variant (currently mauve). To switch accent, copy a different variant over `theme.yml` rather than editing colors by hand. The atuin package holds only themes, no `config.toml`.

**Fish structure.**

- `config.fish` is only for things that must run after `conf.d/`, which is currently the tool initializers (zoxide, fzf, starship).
- `conf.d/` files carry numeric prefixes to fix load order: `00-environment.fish` for PATH and exported variables, `10-abbreviations.fish` for abbreviations.
- `functions/` has one autoloaded function per file, named after the function. The eza wrappers (`l`, `la`, `ll`, `t`) use `--wraps eza` so completions carry over.
- Each file opens with a comment giving its installed path and a one-line purpose.
- Interactive-only files start with `status is-interactive; or return`.
- Optional tools are guarded with `type --query <tool>` so the shell still starts on a machine where they are not installed. The guards are not complete: `fish_greeting` calls `fastfetch`, the eza wrappers call `eza`, and the fzf variables call `fd`, all unguarded.
- `conf.d/fnm.fish` is an exception to the rules above. It was written by the fnm installer and is kept close to generated (only the home path was changed to `$HOME`): no numeric prefix (so it loads after the numbered files), no header comment, and short-form `set`. Re-running the fnm installer may append a duplicate block, so check `git diff` afterwards. Do not use it as a model for new files.
- Long option names are preferred over short flags (`set --global --export`, `abbr --add`).

**Ghostty.** The config file is named `config.ghostty`, not `config`. Split navigation is bound to Alt+Arrow on purpose, because GNOME claims Ctrl+Alt+Arrow for workspace switching.
