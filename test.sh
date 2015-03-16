#!/bin/bash

# echo always returns success
status=0
all=0

log_dir=`pwd`"/logs"

mkdir -p "${log_dir}/tests"

for test in tests/*; do
  output_log="${log_dir}/${test}_output.log" 
  error_log="${log_dir}/${test}_error.log"

  echo -n "" > $output_log
  echo -n "" > $error_log

  echo -n "Running $test: "

  if bash $test "$output_log" "$error_log" > junk 2> junk; then
    echo "PASS"
    status=0
  else
    echo "FAIL"
    status=1
  fi

  echo -e "\n${test} Output Log"
  cat $output_log

  echo -e "\n${test} Error Log"
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
  echo "All tests passed."
  exit 0
else
  echo "One or more tests failed."
  exit 1
fi
