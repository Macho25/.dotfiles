#
# ~/.bash_functions
#

x() {
  chmod +x "$1"

}

mkcd() {
  mkdir "$1" && cd "$1"

}

c() {
  if [ -z "$1" ]; then
    echo "Usage: c <filename without .c> [output path]"
    return 1
  fi

  if [ ! -f "./$1.c" ]; then
    echo "Error: '$1.c' does not exist."
    return 1
  fi

  if [ -n "$2" ]; then
    gcc "$1.c" -o "$2"
  else
    gcc "$1.c" -o "$1"
  fi

  if [ $? -eq 0 ]; then
    echo "Compiled successfully."
  else
    echo "Compilation failed."
  fi
}
