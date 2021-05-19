DIR_PATH=/home/$USER/libs_tmp/ogre/BuildingOgre.txt

if [[ -d $DIR_PATH ]]
then
	echo "$DIR_PATH exists and is a file"
else
	echo "$DIR_PATH does not exist or is not a file"
fi
