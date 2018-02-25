#!/bin/bash

function __oah_destroy {
	environment="$1"

	# TODO Check the ENV is oah status

  # check if the host_mode is vagrant
  if ['$OAH_HOST_TYPE' = 'vagrant']; then

		if [ -n "$environment" ]
		then
			vagrant destroy $environment
		else
			echo "Unable to destroy the environment"
			echo "Please check the status  with oah status and  provide vagrant id  "
			echo "Format is "oah destroy 'id'""
		fi
	fi


}
