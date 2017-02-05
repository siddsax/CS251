#!/bin/bash
data="$(cat file1)"
echo "$data" | sed s/" "/_/g