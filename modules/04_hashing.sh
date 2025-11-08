#!/bin/bash
# Hashing & Integrity

# === Colors & Styles ===
RESET="\e[0m"
BOLD="\e[1m"

CYAN="\e[96m"
GREEN="\e[92m"
YELLOW="\e[93m"
MAGENTA="\e[95m"
RED="\e[91m"
WHITE="\e[97m"
BLUE="\e[94m"

module_04_hashing() {
  echo ""
  echo -e "${GREEN}${BOLD}         HASHING${RESET}"
  echo -e "${MAGENTA}${BOLD} ]========================[${RESET}"
  echo -e "${YELLOW}${BOLD}  1)>${RESET} ${WHITE}${BOLD} MD5${RESET}"
  echo -e "${YELLOW}${BOLD}  2)>${RESET} ${WHITE}${BOLD} SHA256${RESET}"
  echo -e "${YELLOW}${BOLD}  3)>${RESET} ${WHITE}${BOLD} Fuzzy Hash (ssdeep)${RESET}"
  echo -e "${YELLOW}${BOLD}  4)>${RESET} ${WHITE}${BOLD} Verify Known Hashes${RESET}"
  echo -e "${YELLOW}${BOLD}  5)>${RESET} ${RED}${BOLD} Back${RESET}"
  echo ""
  read -p " (SUDHARSHAN)> " opt

  case $opt in
    1) read -p "File: " f; md5sum $f | tee -a "$BASE_DIR/cases/$CURRENT_CASE/hashes.txt";;
    2) read -p "File: " f; sha256sum $f | tee -a "$BASE_DIR/cases/$CURRENT_CASE/hashes.txt";;
    3) read -p "File: " f; ssdeep $f | tee -a "$BASE_DIR/cases/$CURRENT_CASE/hashes.txt";;
    4) read -p "File: " f; read -p "Hashlist file: " list; grep -F $(sha256sum $f | cut -d' ' -f1) $list && echo "Match found";;
    5) return;;
    *) echo "Invalid option";;
  esac
}

