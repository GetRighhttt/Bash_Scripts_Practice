#!/bin/bash

# Script serves as develop and release clean build pattern for Android.
# Initial Start

cd Development/mobile.connected.smarthq.android/Cafe
 
if test $? -ne 0; then
        echo "ERROR: Failed to change directories properly."
        sleep 2
        echo "Exiting.."
        # 'exit 1' error code means syntax error. Used frequently...
        exit 1
else echo "SUCCESS: Changed directories successfully."
        echo "Continuing.."
fi
                
echo "Enter current release: "
read release

# Method Declarations

_pull_changes() {
        git reset --hard
        git clean -fxd
        git pull
} 

_update_develop() {
	git checkout develop
	_pull_changes
}

_install_flutter() {
	sh install_flutter.sh
}

_get_release_branch() {
        if [ -z "$release" ]; then
                echo "The string is empty."
                echo "Aborting..."
		exit1
	else
		echo "Release: $release."
		echo "No errors found."
        fi   

	echo "Preparing to update release..."
        sleep 2
	git checkout $release
}

_update_release_branch() {
	_get_release_branch
	_pull_changes
	
	if test $? -eq 0; then
        	echo "SUCCESS: Changes successfully pulled into release."
	else
        	echo "ERROR: Changes could not be pulled into release."
        	echo "Exiting.."
	exit 1
	fi
	echo "Release updated successfully."
	sleep 2	
	echo
	echo
}

_run_develop_updates() {
	_update_develop
	if test $? -eq 0; then
        	echo "SUCCESS: Changes successfully pulled into develop."
	else
        	echo "ERROR: Changes could not be pulled into develop."
        	echo "Exiting.."
	exit 1
	fi

	_update_release_branch
}

_run_flutter_updates() {
	cd SmartHQ_Flutter_Module/smarthq_flutter_module
	_update_develop
 
        if test $? -eq 0; then
                echo "SUCCESS: Flutter module successfully pulled in changes."
        else
                echo "ERROR: There was an error when pulling changes from flutter module..."
                echo "Exiting.."
        exit 1
        fi
 
        sleep 1
        echo "Preparing to install dependencies..."
        sleep 2
 
        echo "Installing..."
        echo "Should take 35-40 seconds..."
        sleep 1
 
        SECONDS=0
 
        _install_flutter
 
        if test $? -eq 0; then
                echo "SUCCESS: Flutter module successfully installed dependencies."
        else
                echo "ERROR: There was an error updating flutter module..."
                echo "Exiting.."
                exit 1
        fi
 
        echo "Time elapsed: $SECONDS seconds."
        echo
        echo
 
        _update_release_branch
}

_run_commonframework_updates() {
	cd app/src/main/java/com/ge/commonframework
	_update_develop
	        
	if test $? -eq 0; then
        	echo "SUCCESS: Commonframework has successfully pulled in changes."
	else
        	echo "ERROR: Could not pull in changes into commonframework."
        	echo "Exiting.."
        	exit 1
	fi        

	_update_release_branch
}




# Begin Updates

_run_develop_updates
echo
echo "Switching to Flutter module..."
sleep 2
_run_flutter_updates
echo "Switching to Commonframework..."
cd -
sleep 2
_run_commonframework_updates
sleep 2
cd -
echo

if test $? -eq 0; then
	echo "Script finished running successfully!"
	echo "Go ahead and open Android Studio..."
else 
	echo "Error!!!"
	echo "Script failed!"
	echo "Consider checking dependencies and flutter module.."
	echo "Exiting.."
	exit 1
fi

