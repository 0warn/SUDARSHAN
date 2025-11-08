#!/bin/bash
# Keyword Search

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

module_06_keyword() {
  echo ""
  echo -e "    KEYWORD-SEARCH${RESET}"
  echo -e "${MAGENTA}${BOLD} ]=====================[${RESET}"
  echo -e "${YELLOW}${BOLD}  1)>${RESET} ${WHITE}${BOLD} Grep${RESET}"
  echo -e "${YELLOW}${BOLD}  2)>${RESET} ${WHITE}${BOLD} Ripgrep${RESET}"
  echo -e "${YELLOW}${BOLD}  3)>${RESET} ${WHITE}${BOLD} Strings${RESET}"
  echo -e "${YELLOW}${BOLD}  4)>${RESET} ${WHITE}${BOLD} YARA${RESET}"
  echo -e "${YELLOW}${BOLD}  5)>${RESET} ${RED}${BOLD} Back${RESET}"
  echo ""
  read -p " (SUDARSHAN)> " opt

  case $opt in
    1) read -p "Keyword: " k; read -p "Target file/dir: " t; grep -rn "$k" $t | tee -a "$BASE_DIR/cases/$CURRENT_CASE/keywords.txt";;
    2) read -p "Keyword: " k; read -p "Target: " t; rg "$k" $t | tee -a "$BASE_DIR/cases/$CURRENT_CASE/keywords.txt";;
    3) read -p "File: " f; strings $f | tee -a "$BASE_DIR/cases/$CURRENT_CASE/strings.txt";;
    4) read -p "Rules: " r; read -p "Target: " t; yara -r $r $t | tee -a "$BASE_DIR/cases/$CURRENT_CASE/yara.txt";;
    5) return;;
    *) echo "Invalid option";;
  esac
}

