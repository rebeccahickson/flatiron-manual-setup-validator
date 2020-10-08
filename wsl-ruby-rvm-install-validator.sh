#!/bin/sh


# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
NC='\033[0m' # No Color
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'


# https://stackoverflow.com/questions/6212219/passing-parameters-to-a-bash-function
# https://stackoverflow.com/questions/5615717/how-to-store-a-command-in-a-variable-in-linux
# https://stackoverflow.com/questions/17336915/return-value-in-a-bash-function
# $1 => Command to run
evaluate_test () {
  # https://stackoverflow.com/questions/11193466/echo-without-newline-in-a-shell-script
  eval $1 && printf "${GREEN}pass${NC}\n" || printf "${RED}fail${NC}\n"
}

evaluate () {
  eval $1
}

# $1 => Test Name
# $2 => Command to run
print_table_results () {
  local result=$(evaluate_test "$2")
  # https://stackoverflow.com/questions/6345429/how-do-i-print-some-text-in-bash-and-pad-it-with-spaces-to-a-certain-width
  printf "%-30s => [ %-6s ]\n" "$1" "$result"
}

# $1 => Test Name
# $2 => Command to run
print_data_row () {
  local result=$(evaluate "$2")
  # https://stackoverflow.com/questions/6345429/how-do-i-print-some-text-in-bash-and-pad-it-with-spaces-to-a-certain-width
  printf "%-12s => [ %-6s ]\n" "$1" "$result"
}

delimiter () {
  printf "${BLUE}******************************************${NC}\n"
}

validation_header () {
  printf "\n${CYAN}************ VALIDATING RUBY AND RVM SETUP ************${NC}\n\n"
}

configuration_header () {
  printf "\n${CYAN}************* CONFIGURATION **************${NC}\n\n"
}


## Validation
validation_header
delimiter

## 1. Uninstall Learn IDE
## TODO

## 7. Ruby Version Manager (rvm)
print_table_results "Installed RVM" "command -v rvm >/dev/null 2>&1 && which rvm | grep -q '/.rvm/bin/rvm'"
print_table_results "Default RVM (2.6.1)" "command -v rvm >/dev/null 2>&1 && rvm list | grep -Fq '=* ruby-2.6.1 [ x86_64 ]'"
print_table_results "Test RVM PATH" "command -v rvm >/dev/null 2>&1 && rvm list | grep -Fqv 'Warning! PATH'"
delimiter

## 8. Gems
print_table_results "Gem: learn-co" "command -v gem >/dev/null 2>&1 && gem list | grep -q 'learn-co '"
print_table_results "Gem: bundler" "command -v gem >/dev/null 2>&1 && gem list | grep -q 'bundler'"
delimiter
