function prstory() {

	if [[ $# -lt 2 ]]; then
		print_usage
		exit 1
	fi

	src=""

	while [ $# -gt 0 ]
	do
		case "${1}" in
			-s | --source)
				src=${2}
				shift
				;;
			*) # unknown flag
				print_usage
				exit 1;;
		esac
		shift
	done

	# find source branch using $src
	srcBranch=`_gitcli_find_src_branch "${src}"`

	# open browser with PR url
	_gitcli_open_pr_url "${srcBranch}"

	_gitcli_success "Done"
}

function print_usage() {
	echo "usage: gitcli story pullrequest [-s|--source <source>]"
}
