#!/bin/bash 
                                                              
#function __kobman_development_tob_dir {
#
#	local namespace="$1"	
#	local version_id="$2"	
#	cd ~
#	if [ ! -d "${KOBMAN_TOB_DEV_DIR}/von-network" ]; then 
#		__kobman_install_dependancies
#		mkdir -p Dev_TOB
#		cd Dev_TOB
#		export KOBMAN_TOB_DEV_DIR=$PWD
#		cd ${KOBMAN_TOB_DEV_DIR}
#		mkdir -p test/ dependency/
#               	__kobman_echo_cyan "Copying source code  of https://github.com/${namespace}/KOBman to your local system ! "
#	else
#		sudo rm -rf  Dev_TOB
#		__kobman_install_dependancies
#		mkdir -p Dev_TOB
#		cd Dev_TOB
#		export KOBMAN_TOB_DEV_DIR=$PWD
#		cd ${KOBMAN_TOB_DEV_DIR}
#		mkdir -p test/ dependency/
#               	__kobman_echo_cyan "Removing existing older version & Copying newer Version : "${version_id}" ,  source code from https://github.com/${namespace}/KOBman into your local system ! "
#	
#	fi
#
#
#}
function __kobman_install_TheOrgBook
{

	local environment_name="$1"
	local version_id="$2"	

	cd ~	
	
	if [ ! -d "Dev_TheOrgBook" ]; then 
 		__kobman_echo_white "Creating Dev environment for ${environment_name}"
 		__kobman_echo_white "from https://github.com/${KOBMAN_NAMESPACE}/${environment_name}"
 		__kobman_echo_white "version :${version_id} "
		cd ~
		mkdir -p Dev_"${environment_name}"
		cd Dev_"${environment_name}"
#		export Dev_"${environment_name}" = $PWD

		mkdir -p test/ dependency/
		git clone https://github.com/${KOBMAN_NAMESPACE}/${environment_name} 2> /dev/null	
	#	__kobman_install_dependancies
        	
		sudo wget --no-proxy https://github.com/openshift/source-to-image/releases/download/v1.1.14/source-to-image-v1.1.14-874754de-linux-amd64.tar.gz
       		sudo tar -xvzf source-to-image-v1.1.14-874754de-linux-amd64.tar.gz
	        sudo mv sti s2i /usr/local/bin/

		# sudo ~/Dev_von-network/von-network/manage rm
        	sudo ~/Dev_TheOrgBook/TheOrgBook/docker/manage build
		 __kobman_echo_violet "Dev environment for ${environment_name} created successfully"
	else
 		__kobman_echo_white "Removing existing version "
		sudo rm -rf ~/Dev_"${environment_name}"	
 		__kobman_echo_white "Creating Dev environment for ${environment_name}"
 		__kobman_echo_white "from https://github.com/${KOBMAN_NAMESPACE}/${environment_name}"
 		__kobman_echo_white "version :${version_id} "
		
		cd ~
		mkdir -p Dev_"${environment}"
		cd Dev_"${environment}"
		#export Dev_von-network=$PWD
		mkdir -p test/ dependency/

		git clone https://github.com/${KOBMAN_NAMESPACE}/${environment_name} 2> /dev/null	
		sudo wget --no-proxy https://github.com/openshift/source-to-image/releases/download/v1.1.14/source-to-image-v1.1.14-874754de-linux-amd64.tar.gz
       		sudo tar -xvzf source-to-image-v1.1.14-874754de-linux-amd64.tar.gz
	        sudo mv sti s2i /usr/local/bin/

		# sudo ~/Dev_von-network/von-network/manage rm
        	sudo ~/Dev_TheOrgBook/TheOrgBook/docker/manage build



#		__kobman_install_dependancies
#        	sudo ~/Dev_von-network/von-network/manage rm
#        	sudo ~/Dev_von-network/von-network/manage build
		__kobman_echo_violet "Dev environment for ${environment_name} created successfully"
	fi		
	cd ~
















#	local kobman_namespace="$1"
#	local version_id="$2"	
#       	cd ~ 
#       	__kobman_development_tob_dir "${kobman_namespace}" "${version_id}"
#
#	sudo git clone https://github.com/${kobman_namespace}/TheOrgBook.git
#        sudo wget --no-proxy https://github.com/openshift/source-to-image/releases/download/v1.1.14/source-to-image-v1.1.14-874754de-linux-amd64.tar.gz
#        sudo tar -xvzf source-to-image-v1.1.14-874754de-linux-amd64.tar.gz
#        sudo mv sti s2i /usr/local/bin/
#        ${KOBMAN_TOB_DEV_DIR}/TheOrgBook/docker/manage rm 
#	${KOBMAN_TOB_DEV_DIR}/TheOrgBook/docker/manage build
#        sudo sed -i -e 's/- 3000/- 3100/g' ${KOBMAN_TOB_DEV_DIR}/TheOrgBook/docker/docker-compose.yml
#	cd ~
}

function __kobman_start_tob
{
 	__kobman_echo_white "Deploying TheOrgBook environment from Github namespace : "	
	__kobman_echo_green "${kobman_namespace}"
#	chmod a+rwx ${KOBMAN_TOB_DEV_DIR}
	${KOBMAN_TOB_DEV_DIR}/TheOrgBook/docker/manage start seed=the_org_book_0000000000000000000

}

function __kobman_uninstall_tob
{
 	__kobman_echo_white "Removing TheOrgBook environment...  "	
	chmod a+rwx $KOBMAN_TOB_DEV_DIR
	${KOBMAN_TOB_DEV_DIR}/TheOrgBook/docker/manage rm 2> /dev/null	
	rm ${KOBMAN_TOB_DEV_DIR}/source-* 2> /dev/null	
	rm -rf ${KOBMAN_TOB_DEV_DIR}/TheOrgBook/ 2> /dev/null 	
	rm -rf /usr/local/bin/s2i /usr/local/bin/sti TheOrgBook/ 2> /dev/null	
	cd ~
	rm -rf ${KOBMAN_TOB_DEV_DIR} 2> /dev/null
 	__kobman_echo_red "TheOrgBook environment removed !! "	
	cd ~
}	

function __kobman_version_tob
{
	if [ ! -d "${KOBMAN_TOB_DEV_DIR}" ]; then 
		kobman_namespace="$1"
		cd ${KOBMAN_TOB_DEV_DIR} 
		cd TheOrgBook/	
		git show-ref --tag | grep -o 0.0.*
		cd ~
	else
 		__kobman_echo_red "TheOrgBook Environment is not installed in the Local system !"	
	fi
}
