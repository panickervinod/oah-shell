#!/bin/bash
# TODO : List the installed roles on the client, envs {vm/cluster} on the host
# TODO : Use * to show the current installed env , ~ for missing remote env, color code green/Red ,
function __oah_show_current {
  echo "Showing OAH environments Installed at => $OAH_DIR/data/env"
  echo "The current environments are:"
  find $OAH_DIR/data/env -mindepth 1 -maxdepth 1  -exec basename {} \;
}
