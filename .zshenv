# Editor
export EDITOR=vim
export GIT_EDITOR="${EDITOR}"

# Golang
export GOPATH="${HOME}/dev"
export PATH="/usr/local/go/bin:${PATH}"
export PATH="${GOPATH}/bin:${PATH}"

# Ruby
export PATH="${HOME}/.rbenv/bin:${PATH}"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="/usr/local/bin/rubocop-daemon-wrapper:${PATH}"

