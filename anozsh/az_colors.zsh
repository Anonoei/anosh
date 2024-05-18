# Initialize colors

S_B="$(tput bold 2>/dev/null || printf '')"
S_U="$(tput smul 2>/dev/null || printf '')"

F_B="$(tput setaf 0 2>/dev/null || printf '')"
F_R="$(tput setaf 1 2>/dev/null || printf '')"
F_G="$(tput setaf 2 2>/dev/null || printf '')"
F_Y="$(tput setaf 3 2>/dev/null || printf '')"
F_E="$(tput setaf 4 2>/dev/null || printf '')"
F_M="$(tput setaf 5 2>/dev/null || printf '')"
F_C="$(tput setaf 6 2>/dev/null || printf '')"
F_W="$(tput setaf 7 2>/dev/null || printf '')"

B_B="$(tput setab 0 2>/dev/null || printf '')"
B_R="$(tput setab 1 2>/dev/null || printf '')"
B_G="$(tput setab 2 2>/dev/null || printf '')"
B_Y="$(tput setab 3 2>/dev/null || printf '')"
B_E="$(tput setab 4 2>/dev/null || printf '')"
B_M="$(tput setab 5 2>/dev/null || printf '')"
B_C="$(tput setab 6 2>/dev/null || printf '')"
B_W="$(tput setab 7 2>/dev/null || printf '')"

S_R="$(tput sgr0 2>/dev/null || printf '')"
