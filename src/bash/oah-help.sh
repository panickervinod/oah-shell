#!/bin/bash



function __oah_help {
	cat <<EOF

  Try one of the following oah commands:


  oah install [option(-v,-d,-s)] {environment_name} // Install a environment
	oah list [option(-a,-i) ]//List the environments available/installed:
	oah start // Start current environment 
	oah use {environment_name} //use an already installed environment
	oah status // Show the status of the  environmant through vagrant:
	oah show // Show the  environments installed on the vm:
	oah show current //Show the  current environment installed on the vm:
	oah reset //- run from the guest, Resets the environment back:
	oah remove // - run from guest,Remove- Remove all the installed environment and make it as a base machine:
	oah destroy {machine id} //Destroy the guest:
	oah provision {--reload, -k}//Provision the current env - Run this if the oah install does not complete or needs reload
	oah halt //Halt a guest, depending on the OAH_HOST_TYPE


EOF
}
