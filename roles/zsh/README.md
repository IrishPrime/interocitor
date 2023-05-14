# zsh

Install and configure the [`zsh`][zsh] terminal emulator.

Change the `zsh` prompt to use [`powerlevel10k`][pl10k].

Installs several `zsh` plugins:
- `zsh-autosuggestions` - Automatically suggest commands from your history as
  you type.
- `zsh-completions` - Improved tab-completion for a variety of commonly used
  commands.
- `zsh-history-substring-search` - `fish`-like history substring searching.
  Type any part of any command and press `Up` or `Down` to search through your
  history for commands which match that substring.
- `zsh-syntax-highlighting` - To provide syntax highlighting on the prompt as
  you type.

Increase the size of the history, store entries in extended history format
(i.e. timestamps and execution time).

Add support for bookmarks (symlinks in `~/.bookmarks/` that can be navigated to
with the `goto` command).

## Example Playbook

    - hosts: linux
      roles:
         - zsh

## Author Information

Michael "Irish" O'Neill

[zsh]: https://zsh.sourceforge.io/
[pl10k]: https://github.com/romkatv/powerlevel10k
