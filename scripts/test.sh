#!/usr/bin/env bash

# Colors
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# modules=$(ls -1 */*.tf | xargs -I % dirname %)

(terraform validate . && echo -e "[${GREEN}√${NC}] stack") || exit 1

# for m in $modules; do
#   (terraform validate $m && echo -e "[${GREEN}√${NC}] $m") || exit 1
# done