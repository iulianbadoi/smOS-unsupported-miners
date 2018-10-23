install_miner() {
GITHUB_BIN_URL="$(curl -sSL https://api.github.com/repos/$1/releases/latest | jq -r ".assets[] | select(.name | test(\"$2\")) | .browser_download_url")"
    mkdir /root/miner_org/$3
    curl -sSL "$GITHUB_BIN_URL" | tar xvz --strip-components=1 -C /root/miner_org/$3/
}

whiptail --msgbox 'Replacing ethminer-v0.11.0 with Ubqminer.' --backtitle 'Ubqminer' --title 'Replacing ethminer-v0.11.0' 15 55
install_miner "ubiq/ubqminer" "9.1-linux" "ethminer-v0.11.0"
ln -s --force ubqminer ethminer
cd
whiptail --msgbox 'Go to http://simplemining.net and setup a new rig group for ethminer-v0.11.0 that is now actually Ubqminer.  If you have 1080/1080ti You are going to want to enable Ethlargement for this one.' --backtitle 'Ubqminer' --title 'Ubqminer' 15 55
