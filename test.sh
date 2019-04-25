#!/bin/bash

fail=0

# test ruby
for file in problems/*/solve.rb; do
  ruby $file test

  if [ $? -ne 0 ]; then
    fail=1;
  fi
done

if [ $fail -ne 0 ]; then
  echo There was a failure!
  exit $fail
fi
