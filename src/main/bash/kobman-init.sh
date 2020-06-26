#!/usr/bin/env bash


# set env vars if not set
if [ -z "$KOBMAN_VERSION" ]; then
	export KOBMAN_VERSION="0.0.1"
fi

# set kobman namespace if not set
if [ -z "$KOBMAN_NAMESPACE" ]; then
	export KOBMAN_NAMESPACE="hyperledgerkochi"
fi

if [ -z "$KOBMAN_DIR" ]; then
	export KOBMAN_DIR="$HOME/.kobman"
fi

if [[ -z "$INTERACTIVE_MODE" ]]; then
	export INTERACTIVE_MODE="true"
fi
# infer platform
KOBMAN_PLATFORM="$(uname)"
if [[ "$KOBMAN_PLATFORM" == 'Linux' ]]; then
	if [[ "$(uname -m)" == 'i686' ]]; then
		KOBMAN_PLATFORM+='32'
	else
		KOBMAN_PLATFORM+='64'
	fi
fi
export KOBMAN_PLATFORM

# OS specific support (must be 'true' or 'false').
cygwin=false
darwin=false
solaris=false
freebsd=false
case "${KOBMAN_PLATFORM}" in
	CYGWIN*)
		cygwin=true
		;;
	Darwin*)
		darwin=true
		;;
	SunOS*)
		solaris=true
		;;
	FreeBSD*)
		freebsd=true
esac

# Determine shell
zsh_shell=false
bash_shell=false

if [[ -n "$ZSH_VERSION" ]]; then
	zsh_shell=true
else
	bash_shell=true
fi

# Source kobman module scripts and environment files.
#
# Extension files are prefixed with 'kobman-' and found in the env/ folder.
# Use this if environments are written with the functional approach and want
# to use functions in the main kobman script. For more details, refer to
# <https://github.com/kobman/kobman-extensions>.
OLD_IFS="$IFS"
IFS=$'\n'
scripts=($(find "${KOBMAN_DIR}/src" "${KOBMAN_DIR}/envs" -type f -name 'kobman-*'))
for f in "${scripts[@]}"; do
	source "$f"
done
IFS="$OLD_IFS"
unset scripts f

# Load the kobman config if it exists.
if [ -f "${KOBMAN_DIR}/etc/config" ]; then
	source "${KOBMAN_DIR}/etc/config"
fi

unset OLD_IFS candidate_name candidate_dir
export PATH
