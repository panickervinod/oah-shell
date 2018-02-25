#!/bin/bash

function oah {

      COMMAND="$1"
      QUALIFIER="$2"
      OPTION1="$2"
      OPTION2="$3"
      case "$COMMAND" in

          list)
              if [[ "$OPTION1" = "-a" ]]; then
                COMMAND="list-available"
              elif [[ "$OPTION1" = "-i" ]]; then
                COMMAND="list-installed"
              else
                COMMAND="list"
              fi
              ;;
          h)
             COMMAND="help";;

          v)
             COMMAND="version";;

          install)
                # COMMAND="install"
                if [[ "$OPTION1" = "-s" ]]; then
                  COMMAND="install-env"
                elif [[ "$OPTION1" = "-v" ]]; then
                  COMMAND="install-vagrant"
                elif [[ "$OPTION1" = "-d" ]]; then
                  COMMAND="install-docker"
                elif [[ "$OPTION1" = "-h" ]]; then
                  COMMAND="install-helm"
                elif [[ "$OPTION1" = "-r" ]]; then
                  COMMAND="install-runc"
                elif [[ "$OPTION1" = "-c" ]]; then
                  COMMAND="install-cluster"
                else
                  COMMAND="install"
                fi
                ;;

          start)
              if [[ "$OPTION1" = "-s" ]]; then
                COMMAND="start-standalone"
              elif [[ "$OPTION1" = "-v" ]]; then
                COMMAND="start-vagrant"
              elif [[ "$OPTION1" = "-d" ]]; then
                COMMAND="start-docker"
              elif [[ "$OPTION1" = "-c" ]]; then
                COMMAND="start-cluster"
              elif [[ "$OPTION1" = "-k" ]]; then
                COMMAND="start-kubernetes"
              elif [[ "$OPTION1" = "-h" ]]; then
                COMMAND="start-helm"
              else
                COMMAND="start"
              fi
              ;;

          halt)
              # halt current environment
              if [[ "$OPTION1" = "-v" ]]; then
                COMMAND="halt-vagrant"
              elif [[ "$OPTION1" = "-d" ]]; then
                COMMAND="halt-docker"
              elif [[ "$OPTION1" = "-r" ]]; then
                COMMAND="halt-runc"
              elif [[ "$OPTION1" = "-h" ]]; then
                COMMAND="halt-helm"
              elif [[ "$OPTION1" = "-c" ]]; then
                COMMAND="halt-cluster"
              else
                COMMAND="halt"
              fi
              ;;

          status)
              COMMAND="status";;

          reset)
              COMMAND="reset";;

          remove)
              COMMAND="remove";;

          destroy)
              COMMAND="destroy";;

          use)
              COMMAND="use";;

          show)
              if [[ -z "$OPTION1" ]]; then
                COMMAND="show"
              elif [[ -n "$OPTION1" && "$OPTION1" = "current" ]]; then
                COMMAND="show-current"
              else
                COMMAND="help"
              fi
              ;;

      esac

  	#
  	# Various sanity checks and default settings
  	#
  	#__oah_default_environment_variables

  	 	# no command provided
  	if [[ -z "$COMMAND" ]]; then
  		__oah_help
  		return 1
  	fi

  	# Check if it is a valid command
  	CMD_FOUND=""
  	CMD_TARGET="${OAH_DIR}/src/oah-$COMMAND.sh"

  	if [ -f $CMD_TARGET ]; then
  		CMD_FOUND=$CMD_TARGET
  	fi

  		# couldn't find the command
  	if [[ -z "$CMD_FOUND" ]]; then
  		echo "Invalid command: $COMMAND"
  		__oah_help
  	fi

  	# Check whether the candidate exists
  #	local oah_valid_candidate=$(echo ${OVE_CANDIDATES[@]} | grep -w "$QUALIFIER")
  #	if [[ -n "$QUALIFIER" && "$COMMAND" != "offline" && "$COMMAND" != "flush" && "$COMMAND" != "selfupdate" && -z "$ove_valid_candidate" ]]; then
  #		echo -e "\nStop! $QUALIFIER is not a valid candidate."
  #		return 1
  #	fi	# Check whether the command exists as an internal function...
  	#
  	# NOTE Internal commands use underscores rather than hyphens,
  	# hence the name conversion as the first step here.
  	CONVERTED_CMD_NAME=$(echo "$COMMAND" | tr '-' '_')

  	# Execute the requested command
  	if [ -n "$CMD_FOUND" ]; then
  		# It's available as a shell function
  		__oah_"$CONVERTED_CMD_NAME" "$OPTION1" "$OPTION2"
  #		__oah_"$CONVERTED_CMD_NAME"
  	fi

  	# Attempt upgrade after all is done
  #	if [[ "$COMMAND" != "selfupdate" ]]; then
  #	    __oah_auto_update "$OAH_REMOTE_VERSION" "$OAH_VERSION"
  #	fi
}
