#!/bin/bash
# File Carving

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

module_03_carving() {
  echo ""
  echo -e "${GREEN}${BOLD}   FILE CARVING${RESET}"
  echo -e "${MAGENTA}${BOLD} ]=====================[${RESET}"
  echo -e "${YELLOW}${BOLD}  1)> ${RESET} ${WHITE}${BOLD}Foremost${RESET}"
  echo -e "${YELLOW}${BOLD}  2)> ${RESET} ${WHITE}${BOLD}Scalpel${RESET}"
  echo -e "${YELLOW}${BOLD}  3)> ${RESET} ${WHITE}${BOLD}PhotoRec${RESET}"
  echo -e "${YELLOW}${BOLD}  4)> ${RESET} ${WHITE}${BOLD}Bulk Extractor${RESET}"
  echo -e "${YELLOW}${BOLD}  5)> ${RESET} ${RED}${BOLD}Back${RESET}"
  echo ""
  read -p " (SUDARSHAN)> " opt

  case $opt in
    1) read -p "Image file: " img; foremost -i $img -o "$BASE_DIR/cases/$CURRENT_CASE/foremost";;
    2) read -p "Image file: " img; scalpel $img -o "$BASE_DIR/cases/$CURRENT_CASE/scalpel";;
    3) read -p "Image file: " img; photorec /log /d "$BASE_DIR/cases/$CURRENT_CASE/photorec" $img;;
    4) read -p "Image file: " img; bulk_extractor -o "$BASE_DIR/cases/$CURRENT_CASE/bulk" $img;;
    5) return;;
    *) echo "Invalid option";;
  esac
}

