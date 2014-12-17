# dotfiles

#### Repo to keep my configuration files in a git repository in order to centralise them.

## Difference between profile and bash_rc [SOURCE](http://stackoverflow.com/questions/415403/whats-the-difference-between-bashrc-bash-profile-and-environment)
The main difference with shell config files is that some are only read by "login" shells (eg. when you login from another host, or login at the text console of a local unix machine). these are the ones called, say, .login or .profile or .zlogin (depending on which shell you're using).

Then you have config files that are read by "interactive" shells (as in, ones connected to a terminal (or pseudo-terminal in the case of, say, a terminal emulator running under a windowing system). these are the ones with names like .bashrc, .tcshrc, .zshrc, etc.
