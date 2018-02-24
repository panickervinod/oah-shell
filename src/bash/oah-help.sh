#!/bin/bash



function __oah_help {
	cat <<EOF
Install with ove:
Usage:  oah install [option(-v,-d,-s)] {imagename}
 Options
 -v vagrant // will be used for testing and creation of cluster
 -s standalone machine // will make use of localhost as inventory
 -d docker // will make use of localhost as inventory
  Example : To Install Drupal8  on a Windows host with vagrant and Virtualbox:
  oah install -v oah-drupal8-vm

	oah list //List the VMs available:
	oah status // Show the status of the  environmant through vagrant:
	oah show // Show the  environments installed on the vm:
	oah show current //Show the  current environment installed on the vm:
	oah reset //- run from the guest, Resets the environment back:
	oah remove // - run from guest,Remove- Remove all the installed environment and make it as a base machine:
	oah destroy [machine id]} //Destroy the guest:
	oah provision //Provision the vm - Run this if the ove install options fails in between:
	oah halt //Halt a guest:

EOF
}
