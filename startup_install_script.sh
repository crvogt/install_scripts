# Make sure to include Zoom (may not be needed goiing ahead

USER='carson'
# Checking for greater than zero build flags
BUILD_OGRE=""
INSTALL_ROS=""
INSTALL_GAZEBO=""
BINSTALL_DAVE_DIRECTORIES=""
SUBLIME_HOME='sublime_text_2'

cd /home/$USER 

sudo apt-get install vim git cmake cmake-qt-gui gcc g++ build-essential tmux vlc ffmpeg python3-pip openssh-server openssh-client texlive-full texmaker -y

# Currently required to avoid opencv hangup
python3 -m pip install --upgrade pip

python3 -m pip install matplotlib scipy 
python3 -m pip install scikit-build opencv-python

mkdir libs

# Downloading 
# Sublime
wget https://download.sublimetext.com/Sublime%20Text%202.0.2%20x64.tar.bz2
tar xvf Sublime*
rm Sublime*.tar.bz2
mv Sublime* /home/$USER/libs/$SUBLIME_HOME

touch .bash_aliases
echo $SUBLIME_HOME
echo alias subl=/home/$USER/libs/$SUBLIME_HOME/sublime_text >> .bash_aliases

touch .gitignore_global
echo '.idea' >> .gitignore_global
echo '.cache' >> .gitignore_global

git config --global user.name 'crvogt'
git config --global user.email 'crvogt26@gmail.com'
git config --global core.excludesfile /home/$USER/.gitignore_global

touch .tmux.conf
echo 'unbind C-b' >> .tmux.conf
echo 'set-option -g prefix C-a' >> .tmux.conf
echo 'bind-key C-a send-prefix' >> .tmux.conf
echo 'bind | split-window -h' >> .tmux.conf
echo 'bind - split-window -v' >> .tmux.conf
echo 'unbind \"' >> .tmux.conf
echo 'unbind %' >> .tmux.conf
echo 'bind -n M-Left select-pane -L' >> .tmux.conf
echo 'bind -n M-Right select-pane -R' >> .tmux.conf
echo 'bind -n M-Up select-pane -U' >> .tmux.conf
echo 'bind -n M-Down select-pane -D' >> .tmux.conf

if [[ -n $INSTALL_ROS  ]]
then
	install_ros_script.sh
elif [[ -n $INSTALL_GAZEBO ]]
then
	install_gazebo_script.sh
elif [[ -n $BINSTALL_DAVE_DIRECTORIES ]]
then
	install_dave_script.sh
fi

source .bashrc
