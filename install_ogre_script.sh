OGRE_VERSION='v1.9.1'
OGRE_DIR='/home/$USER/libs/ogre'

if [[ -d OGRE_DIR ]]
then
	echo 'Ogre seems to be installed...'
else
	mkdir -p /home/$USER/libs/
	git clone https://github.com/ogrecave/ogre
	git checkout $OGRE_VERSION

