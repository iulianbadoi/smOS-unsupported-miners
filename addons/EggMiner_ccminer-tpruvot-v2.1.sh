install_miner() {
GITHUB_BIN_URL="$(curl -sSL https://api.github.com/repos/$1/releases/latest | jq -r ".assets[] | select(.name | test(\"$2\")) | .browser_download_url")"
    mkdir /root/miner_org/$3
    curl -sSL "$GITHUB_BIN_URL" | tar xvz --strip-components=1 -C /root/miner_org/$3/
}

whiptail --msgbox "Replacing ccminer-tpruvot-v2.1 with EggMinerV4." --backtitle "EggMinerV4" --title "Replacing ccminer-tpruvot-v2.1" 15 55
install_miner "EggPool/EggMinerGpu" "Lin" "ccminer-tpruvot-v2.1"
ln -s --force eggminer miner
cd
whiptail --msgbox "Go to http://simplemining.net and setup a new rig group for ccminer-tpruvot-v2.1 that is now actually EggMinerV4." --backtitle "EggMinerV4" --title "EggMinerV4" 15 55
