#!/bin/bash
# oah script to show the status of the env on the host
function __oah_status {

#TODO check $OAH_HOST_TYPE
 vagrant global-status
}
