#!/bin/bash

# ==============================================================================
#  PROJECT     : TaproCloud BOT (ADVANCED AUTOMATION)
#  DESCRIPTION : COMPLETE LXD & PYTHON DEPENDENCY INSTALLER
#  DEVELOPER   : @ogitzdude
#  VERSION     : 4.0
# ==============================================================================

clear

# Color Definitions
BLUE='\033[1;34m'
CYAN='\033[1;36m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m' # No Color

# --- ASCII TITLE ---
echo -e "${CYAN}"
echo "  TTTTTTTTTTTTTTTTTTTTTTT                                                                      "
echo "  T:::::::::::::::::::::T                                                                      "
echo "  T:::::::::::::::::::::T                                                                      "
echo "  T:::::TT:::::::TT:::::T                                                                      "
echo "  TTTTTT  T:::::T  TTTTTTaaaaaaaaaaaaa  pp ppppppp   rrrr rrrr r rrrrr      ooooooooooo        "
echo "          T:::::T        a::::::::::::a p:p    pppppp r:::r    r  r:::::r   oo:::::::::::oo      "
echo "          T:::::T        aaaaaaaaa:::::ap:::::pp      r::::r    rr:::::::r o:::::::::::::::o     "
echo "          T:::::T                 a::::ap:::::p       rr::::r     r:::::r  o:::::ooooo:::::o     "
echo "          T:::::T          aaaaaaa:::::ap:::::p        r::::r     r:::::r  o::::o     o::::o     "
echo "          T:::::T        aa::::::::::::ap:::::p        r::::r     r:::::r  o::::o     o::::o     "
echo "          T:::::T       a::::aaaa::::::ap:::::p        r::::r     r:::::r  o::::o     o::::o     "
echo "          T:::::T      a::::a    a:::::ap:::::p        r::::r     r:::::r  o::::o     o::::o     "
echo "        TT:::::::TT    a::::a    a:::::ap:::::ppppp    r::::r     r:::::r  o:::::ooooo:::::o     "
echo "        T:::::::::T    a::::aaaaa::::::ap:::::p    p   r::::r     r:::::r  o:::::::::::::::o     "
echo "        T:::::::::T     a::::::::::aa:::ap:::::ppppp    r::::r     r:::::r   oo:::::::::::oo      "
echo "        TTTTTTTTTTT      aaaaaaaaaa  aaaap:::::p        rrrrrr     rrrrrrr     ooooooooooo        "
echo "                                         p:::::p                                               "
echo "                                         p:::::p                                               "
echo "                                        p:::::::p                                              "
echo "                                        p:::::::p                                              "
echo "                                        p:::::::p                                              "
echo "                                        ppppppppp                                              "
echo -e "${NC}"

echo -e "${BLUE}======================================================================${NC}"
echo -e "${YELLOW}                 PRODUCT: TaproCloud BOT SYSTEM                      ${NC}"
echo -e "${GREEN}                 DEVELOPED BY: @ogitzdude                            ${NC}"
echo -e "${BLUE}======================================================================${NC}"
echo ""

# --- COMMANDS EXECUTION ---

echo -e "${CYAN}[*] Step 1: Updating System & Installing Tools...${NC}"
sudo apt update && sudo apt upgrade -y
sudo apt install lxc lxc-utils bridge-utils uidmap snapd -y
sudo systemctl enable --now snapd.socket

echo -e "${CYAN}[*] Step 2: Setting up LXD Container Engine...${NC}"
sudo snap install lxd
sudo usermod -aG lxd $USER
# Non-interactive init
sudo lxd init --auto

echo -e "${CYAN}[*] Step 3: Installing Python & Library Dependencies...${NC}"
sudo apt install python3-pip -y
pip install -U discord.py aiohttp playwright
playwright install chromium
sudo playwright install-deps

echo -e "${CYAN}[*] Step 4: Finalizing Setup...${NC}"
sudo apt update

echo -e "${GREEN}"
echo "----------------------------------------------------------------------"
echo " SETUP COMPLETED! TaproCloud BOT IS READY TO DEPLOY."
echo " DEVELOPER: @ogitzdude | ENJOY YOUR AUTOMATION."
echo "----------------------------------------------------------------------"
echo -e "${NC}"

# --- EXECUTION ---
if [ -f "v4.py" ]; then
    echo -e "${YELLOW}>>> Launching v4.py...${NC}"
    python3 v4.py
else
    echo -e "${RED}[!] Error: v4.py not found in this directory!${NC}"
fi
