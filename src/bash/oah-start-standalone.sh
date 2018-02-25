__oah_start_standalone ()
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

  # check and run ansible standalone playbook
  if [ "$oah_operation_mode" = "-s" and $OAH_HOST_TYPE = standalone]
    then
    echo "About to start playbook in standalone mode:  $env_base_url/$oah_env_repo.git"
    git clone $env_base_url/$oah_env_repo.git
    ansible-galaxy install -r $oah_env_repo/provisioning/requirements.yml
    ansible-playbook $oah_env_repo/provisioning/oah-install.yml -K
  fi

  
}