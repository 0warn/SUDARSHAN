#!/bin/bash
# Timeline Analysis

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

module_05_timeline() {
  echo ""
  echo -e "${GREEN}${BOLD}     TIMELINE ANALYSIS ${RESET}"
  echo -e "${MAGENTA}${BOLD} ]==========================[${RESET}"
  echo -e "${YELLOW}${BOLD}  1)>${RESET} ${WHITE}${BOLD} Create Bodyfile (fls)${RESET}"
  echo -e "${YELLOW}${BOLD}  2)>${RESET} ${WHITE}${BOLD} Create Timeline (mactime)${RESET}"
  echo -e "${YELLOW}${BOLD}  3)>${RESET} ${WHITE}${BOLD} Log2Timeline (Plaso)${RESET}"
  echo -e "${YELLOW}${BOLD}  4)>${RESET} ${RED}${BOLD} Back${RESET}"
  echo ""
  read -p " (SUDARSHAN)> " opt

  case $opt in
    1) read -p "Image: " img; fls -r -m / $img > "$BASE_DIR/cases/$CURRENT_CASE/bodyfile";;
    2) read -p "Bodyfile: " bf; mactime -b $bf > "$BASE_DIR/cases/$CURRENT_CASE/timeline.txt";;
    3) read -p "Image: " img; log2timeline.py "$BASE_DIR/cases/$CURRENT_CASE/plaso.dump" $img;;
    4) return;;
    *) echo "Invalid option";;
  esac
}

