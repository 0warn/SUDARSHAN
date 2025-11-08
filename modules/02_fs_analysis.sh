#!/bin/bash
# File System Analysis - Sleuthkit style

# == COLOR & STYLE ==
RESET="\e[0m"
BOLD="\e[1m"

CYAN="\e[96m"
GREEN="\e[92m"
YELLOW="\e[93m"
MAGENTA="\e[95m"
RED="\e[91m"
WHITE="\e[97m"
BLUE="\e[94m"

module_02_fs_analysis() {
  echo ""
  echo -e "${GREEN}${BOLD}     FILE SYSTEM ANALYSIS ${RESET} "
  echo -e "${MAGENTA}${BOLD}]===========================================[${RESET}"
  echo -e "${YELLOW}${BOLD}  1)> ${RESET} ${WHITE}${BOLD} List Partitions (mmls)${RESET}"
  echo -e "${YELLOW}${BOLD}  2)> ${RESET} ${WHITE}${BOLD} List Files in Image (fls)${RESET}"
  echo -e "${YELLOW}${BOLD}  3)> ${RESET} ${WHITE}${BOLD} Extract File (icat)${RESET}"
  echo -e "${YELLOW}${BOLD}  4)> ${RESET} ${WHITE}${BOLD} File Type Analysis (file/disktype)${RESET}"
  echo -e "${YELLOW}${BOLD}  5)> ${RESET} ${RED}${BOLD} Back${RESET}"
  echo ""
  read -p " (SUDARSHAN)> " opt

  case $opt in
    1) read -p "Image file: " img; mmls $img | tee -a "$BASE_DIR/cases/$CURRENT_CASE/fs.txt";;
    2) read -p "Image file: " img; fls -r $img | tee -a "$BASE_DIR/cases/$CURRENT_CASE/fs.txt";;
    3) read -p "Image file: " img; read -p "Inode number: " inode; icat $img $inode > "$BASE_DIR/cases/$CURRENT_CASE/extracted_$inode";;
    4) read -p "File: " file; disktype $file | tee -a "$BASE_DIR/cases/$CURRENT_CASE/fs.txt";;
    5) return;;
    *) echo "Invalid option";;
  esac
}

