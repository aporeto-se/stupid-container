#!/bin/bash

main() {
  /usr/sbin/stupid-http
}

err() { echo "$@" 1>&2; }

main $@
