cd /home/$USER/Downloads

wget https://zoom.us/client/latest/zoom_amd64.deb

sudo dpkg -i zoom_amd64.deb

if [ $? -eq 0 ]
then
	echo
	echo 'Zoom installed fine'
	echo
else
	echo
	echo 'Zoom failed to install'
	echo 'Probably install missing dependencies'

	echo 'Attempting to fix missing...'
	echo
	sudo apt --fix-broken install -y
	sudo dpkg -i zoom_amd64.deb
fi

echo
echo 'Cleaning up...'
echo
rm zoom*

