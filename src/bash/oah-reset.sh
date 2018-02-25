#!/bin/bash
#oah script to reset the env to plain installation
function __oah_reset {
  local current_env=`ove show current | cut -d " " -f 5`
  echo " About to Reset environment => $current_env"
  __oah_remove
  __oah_install -s $current_env
}
