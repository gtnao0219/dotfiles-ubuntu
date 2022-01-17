# Path
typeset -gx -U path
path=( \
  /usr/local/bin(N-/) \
  ~/bin(N-/) \
  "$path[@]" \
)

# Editor
export EDITOR=vim
export VISUAL=vim
export GIT_EDITOR="${EDITOR}"

# Zinit
export ZINIT_HOME="${HOME}/.zinit"

# Golang
export GOPATH="${HOME}/dev"
export PATH="/usr/local/go/bin:${PATH}"
export PATH="${GOPATH}/bin:${PATH}"

# Ruby
export PATH="${HOME}/.rbenv/bin:${PATH}"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="/usr/local/bin/rubocop-daemon-wrapper:${PATH}"

# Rust
export PATH="${HOME}/.cargo/bin:${PATH}"
. "$HOME/.cargo/env"

