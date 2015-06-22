#!/bin/bash

# Text color variables
txtgrn='\e[0;32m'       # green
txtylw='\e[0;33m'       # yellow
txtred='\e[0;31m'       # red
txtblu='\e[0;34m'       # blue

txtrst='\e[0m'          # Text reset

# Feedback indicators
function echo_info() { echo -e "${txtblu}$*${txtrst}"; }
function echo_pass() { echo -e "${txtgrn}$*${txtrst}"; }
function echo_fail() { echo -e "${txtred}$*${txtrst}"; }

# echo always returns success
status=0
all=0

log_dir=`pwd`"/logs"

if [[ -d $log_dir ]]; then
  rm -rf $log_dir
fi

mkdir -p "${log_dir}/tests"

for test in tests/*.sh; do
  output_log="${log_dir}/${test}_output.log"
  error_log="${log_dir}/${test}_error.log"
  files_pass="${log_dir}/${test}_pass.log"
  files_fail="${log_dir}/${test}_fail.log"

  touch $output_log
  touch $error_log
  touch $files_pass
  touch $files_fail

  echo -n "Running $test: "

  if bash $test "$output_log" "$error_log" "$files_pass" "$files_fail" > junk 2> junk; then
    echo_pass "PASS"
    status=0
  else
    echo_fail "FAIL"
    status=1
  fi

  echo_info "\n${test} Output Log"
  while read line; do
    echo -n $line; echo_pass ": PASS"
  done < $files_pass
  cat $output_log

  echo_info "\n${test} Error Log"
  while read line; do
    echo -n $line; echo_fail ": FAIL"
  done < $files_fail
  cat $error_log

  if [[ $status == 0 && $all == 0 ]]; then
    all=0
  else
    all=1
  fi
done

if [[ -f junk ]]; then
  rm junk
fi

echo ""
if [[ $all == 0 ]]; then
  echo_pass "All tests passed."
  exit 0
else
  echo_fail "One or more tests failed."
  exit 1
fi
