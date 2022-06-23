export PATH="/opt/homebrew/opt/python@3.9/libexec/bin:/opt/homebrew/opt/openssl@3/bin:/opt/homebrew/bin:$PATH"
export BASH_SILENCE_DEPRECATION_WARNING=1

alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias nsflush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

function crtreq() { openssl req -config ~/Certs/openssl.conf -nodes -newkey rsa:2048 -sha256 -keyout $1.key -days 1095 -out $1.csr; }
function csrchk() { openssl req -text -noout -verify -in $1; }
function keychk() { openssl rsa -in $1 -check; }
function crtchk() { openssl x509 -in $1 -text -noout; }
function sslchk() { openssl s_client -servername $1 -connect $1:$2 -showcerts </dev/null 2>/dev/null | openssl x509 -text -in /dev/stdin; }
function chnchk() { openssl s_client -servername $1 -connect $1:$2 -showcerts </dev/null 2>/dev/null; }

complete -C /opt/homebrew/bin/terraform terraform
complete -C '/usr/local/bin/aws_completer' aws

