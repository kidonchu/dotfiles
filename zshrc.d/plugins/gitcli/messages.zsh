ERROR="$(tput setaf 1)ERROR: $(tput sgr0)"
PROCESS="$(tput setaf 5)PROCESSING: $(tput sgr0)"
SUCCESS="$(tput setaf 2)SUCCESS: $(tput sgr0)"
NOTICE="$(tput setaf 4)NOTICE: $(tput sgr0)"

function _gitcli_error() {
	echo ${ERROR}${1}
}

function _gitcli_process() {
	echo ${PROCESS}${1}
}

function _gitcli_success() {
	echo ${SUCCESS}${1}
}

function _gitcli_notice() {
	echo ${NOTICE}${1}
}