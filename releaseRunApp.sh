#!/bin/bash

# Script serves as generic build pattern for Android.

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

# Method Declarations

_clean_and_reset() {
	git checkout develop
	git reset --hard
	git clean -fxd
}

_pull_changes() {
	git pull
}

_install_flutter() {
	sh install_flutter.sh
}

echo "Enter current release: "
read release_branch

_get_release_branch() {
	echo "Preparing to update release..."
        sleep 2
	git checkout $release_branch
}

_update_release_branch() {
	_get_release_branch
	git reset --hard
	git clean -fxd
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

_clean_and_reset
_pull_changes

if test $? -eq 0; then
	echo "SUCCESS: Changes successfully pulled into develop."
else 
	echo "ERROR: Changes could not be pulled into develop."
	echo "Exiting.."
exit 1
fi

_update_release_branch

echo
echo

echo "Switching to Flutter module..."
sleep 2

cd SmartHQ_Flutter_Module/smarthq_flutter_module

_clean_and_reset
_pull_changes

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

echo "Switching to Commonframework..."
cd -
sleep 2

cd app/src/main/java/com/ge/commonframework

_clean_and_reset
_pull_changes

if test $? -eq 0; then
	echo "SUCCESS: Commonframework has successfully pulled in changes."
else 
	echo "ERROR: Could not pull in changes into commonframework."
	echo "Exiting.."
	exit 1
fi

_update_release_branch

sleep 2
cd -

echo
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

