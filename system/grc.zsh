# GRC colorizes nifty unix tools all over the place
if (( $+commands[grc] )) && (( $+commands[brew] ))
then
  sed -i 's/type -p grc/which grc/g' /usr/local/etc/grc.bashrc # type -p returns extra output on OSX, breaking the script. Use which instead.
  source `brew --prefix`/etc/grc.bashrc
fi
