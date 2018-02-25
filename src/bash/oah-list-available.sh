#!/bin/bash

function  __oah_list_available {
  echo "OAH environment list :"
  # TODO fix this.. 
  oah_env_folder=$OAH_DOT_ENV_DIR
  OAH_CANDIDATES=(${OAH_CANDIDATES_CSV})
  #IFS="$OLD_IFS"
  for (( i=0; i <= ${#OAH_CANDIDATES}; i++ )); do
    # Eliminate empty entries due to incompatibility
    if [[ -n ${OAH_CANDIDATES[${i}]} ]]; then
      CANDIDATE_NAME="${OAH_CANDIDATES[${i}]}"
      cut_field=$(echo  "$CANDIDATE_NAME" |grep -o ,| wc -l)
      if [ "${cut_field}" -eq 0 ];
      then
        env_name=$(echo "$CANDIDATE_NAME")
        Version_name="master"
      else
        cut_field_1=$[cut_field + 1]
        env_name=$(echo  "$CANDIDATE_NAME" |cut -f1 -d',')
        Version_name_old=$(echo  "$CANDIDATE_NAME" |cut -f2-$cut_field_1 -d',')
        # Version_name=$(echo "$Version_name_old*")
        version_cut_field=$(echo  "$Version_name_old" |grep -o ,| wc -l)
        #echo "version_cut_field=(echo  Version_name_old |grep -o ,| wc -l) is $version_cut_field"
        if [[ "${version_cut_field}" -eq 0 ]];
        then
          Version_name=$(echo "*$Version_name_old")
        else
          cut_field_2=$[version_cut_field + 1]
          Version_name_1=$(echo  "$Version_name_old" |cut -f1-$version_cut_field -d',')
          #echo "Version_name_1=(echo  Version_name_old |cut -f1-version_cut_field -d',') is $Version_name_1"
          Version_name_2=$(echo  "$Version_name_old" |cut -f$cut_field_2 -d',')
          #echo "Version_name_2=(echo  Version_name_old |cut -fcut_field_2 -d',') is $Version_name_2"
          Version_name=$(echo $Version_name_1,*$Version_name_2 )
        fi
      fi
      current_env=$(oah show current)
      Version_new=$(echo "$current_env" | grep -w "$env_name")
      if [[ -n "${Version_new}" ]];
      then
        env_name=$(echo ">$Version_new")
      fi
      echo "$env_name [$Version_name]"
      unset CANDIDATE_NAME
    fi
  done
}
