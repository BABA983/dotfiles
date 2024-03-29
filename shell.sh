# Note: there is no shebang in this script. This script sets my preferred shell
# configuration and should be able to be sourced from any Bash-like shell or
# from Z shell.

# The first section of the script checks the current shell parameters (which are stored in the special $- variable)
# to see whether the i (interactive) parameter is present.
# If it is not present, the return command runs.
# This check for the shell parameters ensures that
# even if a non-interactive shell does load the run commands file for some reason,
# it stops reading it right away.

# sh -iex ./shell.sh
# i - this makes the shell interactive - our script only runs in interactive shells so we need this to test it!
# e - this causes the shell to exit if a command fails
# x - this sets the tracing output


# If we are not running interactively do not continue loading this file.
case $- in
    *i*) ;;
      *) return;;
esac

# Set our preferred editor to the first available editor in the array below.
preferred_editors=(nvim vim code nano vi)
for editor in ${preferred_editors[@]}; do
    if command -v "${editor}" >/dev/null 2>&1; then
        # Note that 'VISUAL' can be a full screen terminal editor. On legacy
        # systems 'EDITOR' was normally a line mode editor but there is
        # generally no need to differentiate any more.
        VISUAL="$(command -v ${editor})"
        EDITOR="${VISUAL}"
        break
    fi
done
unset editor preferred_editors

# Allow us to use Ctrl+S to perform forward search, by disabling the start and
# stop output control signals, which are not needed on modern systems.
stty -ixon

# Set a shell option but don't fail if it doesn't exist!
safe_set() { shopt -s "$1" >/dev/null 2>&1 || true; }

# Set some options to make working with folders a little easier. Note that we
# send all output to '/dev/null' as startup files should not write to the
# terminal and older shells might not have these options.
safe_set autocd         # Enter a folder name to 'cd' to it.
safe_set cdspell        # Fix minor spelling issues with 'cd'.
safe_set dirspell       # Fix minor spelling issues for commands.
safe_set cdable_vars    # Allow 'cd varname' to switch directory.

# Uncomment the below if you want to be able to 'cd' into directories that are
# not just relative to the current location. For example, if the below was
# uncommented we could 'cd my_project' from anywhere if 'my_project' is in
# the 'repos' folder.
# CDPATH="~:~/repos"

# Configure the history to make it large and support multi-line commands.
safe_set histappend                  # Don't overwrite the history file, append.
safe_set cmdhist                     # Multi-line commands are one entry only.
PROMPT_COMMAND='history -a'          # Before we prompt, save the history.
HISTSIZE=10000                       # A large number of commands per session.
HISTFILESIZE=100000                  # A huge number of commands in the file.
# HISTCONTROL="ignorespace:ignoredup" # Ignore starting with space or duplicates?
# export HISTIGNORE="ls:history"     # Any commands we want to not record?
# HISTTIMEFORMAT='%F %T '            # Do we want a timestamp for commands?
