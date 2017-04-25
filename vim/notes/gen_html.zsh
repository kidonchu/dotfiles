#!/bin/bash

ERROR="$(tput setaf 1)ERROR: $(tput sgr0)"

function gen_md_html() {
	if [[ $# -lt 1 ]]; then
		echo >&2 "${ERROR}Not enough argument to generate markdown"
		exit 1
	fi
	input="${1}"
	output="html/${input%.*}.html" # remove extension and append html ext
	python -m markdown "${input}" > "${output}"
}

arg="${1}"
# if single file, convert it and exit
if [[ -f "${arg}" ]]; then
	gen_md_html "${i}"
	exit 0
fi

# if directory is given, cd into the directory first
if [[ -d "${arg}" ]]; then
	cd "${arg}"
fi

# if html output directory doesn't exist, create one first
if [[ ! -d "./html" ]]; then
	mkdir html
fi

for i in $(ls *.md); do
	gen_md_html "${i}"
done
