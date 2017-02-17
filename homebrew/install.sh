#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install homebrew packages
info "Installing Homebrew bundle"
if brew bundle --global
then
  success "Installed Homebrew bundle"
else
  fail "Error installing Homebrew bundle"
fi

exit 0
