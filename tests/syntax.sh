#!/bin/bash

output_log=$1
error_log=$2
files_pass=$3
files_fail=$4

test_list="$(pwd)/folder_file_list.tmp"

cd src/
status=0
all=0

folders="system/bashrc system/bin system/bin/git system/functions"
files="bashwf system/colors.sh system/config.sh system/init.sh system/init_colors.sh system/init_unicode.sh system/nocolors.sh system/utils.sh"
ignore="system/bin/pushpop"

function test_file()
{
  local file="$1"
  if bash -n "$file" 2>> $error_log >> $output_log; then
    echo "$file" >> $files_pass
    status=0
  else
    echo "$file" >> $files_fail
    status=1
  fi

  if [[ $status == 0 && $all == 0 ]]; then
    all=0
  else
    all=1
  fi
}

function add_not_ignored()
{
  local is_good=0

  for ignored_file in $ignore; do
    if [[ "$1" != "$ignored_file" && $is_good == 0 ]]; then
      is_good=0
    else
      is_good=1
    fi
  done

  if [[ $is_good == 0 ]]; then
    echo "$1" >> $test_list
  fi
}

mkdir -p tmp

for file in $files; do
  add_not_ignored "$file"
done

for folder in $folders; do
  # echo $folder
  for file in $folder/*; do
    # echo $file
    if [[ -f "$file" ]]; then
      add_not_ignored $file
    fi
  done
done

while read file; do
  test_file "$file"
done < $test_list

rm -f $test_list
rmdir tmp

if [[ $all == 0 ]]; then
  exit 0
else
  exit 1
fi
