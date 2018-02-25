#!/bin/bash

function __oah_up {
	  # TODO check $OAH_HOST_TYPE is vagrant
		# TODO check and set ${OAH_CURRENT_ENV_DIR}
		
		if ['$OAH_HOST_TYPE' = 'vagrant'] ; then

    do
		# bring up the current environment
		vagrant up
	  fi

		# check $OAH_HOST_TYPE is docker
		if ['$OAH_HOST_TYPE' = 'docker'] ; then

		do
		# bring up the current environment
		oah_dockerfile=${OAH_CURRENT_ENV_DIR}dockerfile
		docker-compose $oah_dockerfile
		fi

		# check $OAH_HOST_TYPE is runc
		if ['$OAH_HOST_TYPE' = 'runc'] ; then

		do
		# bring up the current environment
		oah_run_makefile=${${OAH_CURRENT_ENV_DIR}}makefile
		runc $oah_run_makefile
		fi

}
