# Path
typeset -gx -U path
path=( \
  /usr/local/bin(N-/) \
  ~/bin(N-/) \
  "$path[@]" \
)

# Editor
if whence nvim > /dev/null; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi
export VISUAL=${EDITOR}
export GIT_EDITOR=${EDITOR}

# Vim
export MYVIMRC="${HOME}/.vimrc"

# Zinit
export ZINIT_HOME="${HOME}/.zinit"

# Linux Homebrew
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Golang
export GOPATH="${HOME}/dev"
export PATH="/usr/local/go/bin:${PATH}"
export PATH="${GOPATH}/bin:${PATH}"

# Ruby
export PATH="${HOME}/.rbenv/bin:${PATH}"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="/usr/local/bin/rubocop-daemon-wrapper:${PATH}"

# Python 
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"
if which pyenv > /dev/null; then eval "$(pyenv init --path)"; fi
export PATH="${HOME}/.local/bin:${PATH}"

# Rust
export PATH="${HOME}/.cargo/bin:${PATH}"
if [ -e "${HOME}/.cargo/env" ]; then
  source "${HOME}/.cargo/env"
fi

# Java
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export GRADLE_HOME="/opt/gradle/latest"
export PATH="${GRADLE_HOME}/bin:${PATH}"

export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'
export BAT_THEME='Gruvbox-N'

