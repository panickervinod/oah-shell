__oah_start_docker ()
{
  #TODO check $ARG3 and $ARG2
  #TODO check for $OAH_HOST_TYPE and handle depending on host types of vagrant, docker, kubernetes and standalone

  oah_env_repo=$ARG3
  oah_operation_mode=$ARG2
  env_base_url=http://github.com/$OAH_NAMESPACE

  echo " Starting $oah_env_repo , oah_operation_mode => $oah_operation_mode,"
  echo "  oah_operation_mode => $oah_operation_mode,"
  # TODO do an vagrant up in case of host mode
  if [$OAH_HOST_TYPE = vagrant ] ; then

  # continue
 else

  echo "oah start needs can be executed only in host mode of vagrant, docker or kubernetes"

  fi



  # TODO check and run docker-compose
  if [ "$oah_operation_mode" = "-d" and $OAH_HOST_TYPE = docker]
    then
    echo "About to run docker compose :  $env_base_url/$oah_env_repo.git"
    git clone $env_base_url/$oah_env_repo.git
    ansible-galaxy install -r $oah_env_repo/provisioning/requirements.yml
    ansible-playbook $oah_env_repo/provisioning/oah-docker-install.yml -K
  fi


}
