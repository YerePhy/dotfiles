#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

cd ~

# Common packages 
apt-get update
apt-get install -y \
	sudo \
	git-all \
       	tmux \
	curl \
	htop \
	drawing \
	xsel \
	vim 
apt-get install -f -y

# Install ctrlp.vim
mkdir ~/.vim
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim 

# Install vim-fugitive
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/fugitive.git
vim -u NONE -c "helptags fugitive/doc" -c 

# Install python3.9 
apt-get install -y software-properties-common 
add-apt-repository ppa:deadsnakes/ppa
apt-get install -y python3.9

# Install conda
curl https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh -o conda.sh
sha256sum ./conda.sh
chmod +x ./conda.sh
bash ./conda.sh -b -p $HOME/miniconda
rm ./conda.sh
eval "$(~/miniconda/bin/conda shell.bash hook)"
$HOME/miniconda/bin/conda init
source ~/.bashrc
conda init

# Install Teams
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'
apt-get update -y
apt-get install -y teams 

# Install Zotero 
curl https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh -o install.sh
chmod +x ./install.sh
bash ./install.sh
apt-get update
apt-get install -y zotero
apt-get install -y -f

# Install Google-Chrome
curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o chrome.deb
chmod +x ./chrome.deb
apt-get -y install ./chrome.deb
apt-get install -y -f
rm ./chrome.deb

# Google Chrome extensions
install_chrome_extension () {
    preferences_dir_path="/opt/google/chrome/extensions"
    pref_file_path="$preferences_dir_path/$1.json"
    upd_url="https://clients2.google.com/service/update2/crx"
    mkdir -p "$preferences_dir_path"
    echo "{" > "$pref_file_path"
    echo "  \"external_update_url\": \"$upd_url\"" >> "$pref_file_path"
    echo "}" >> "$pref_file_path"
    echo Added \""$pref_file_path"\" ["$2"]
}

install_chrome_extension "ekhagklcjbdpajgpjgmbionohlpdbjgc" "zotero connector"
install_chrome_extension "dbepggeogbaibhgnhhndojpepiihcmeb" "vimium"
install_chrome_extension "igkpcodhieompeloncfnbekccinhapdb" "zoho vault"
install_chrome_extension "kbfnbcaeplbcioakkpcpgfkobkghlhen" "grammarly"
