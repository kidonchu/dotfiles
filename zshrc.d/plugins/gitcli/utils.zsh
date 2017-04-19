# $1: config key
function _gitcli_get_config() {
	config=`git config --list | grep "${1}"`
	if [ -z "${config}" ]; then
		return 0
	fi
	config=`echo ${config} | cut -d'=' -f 2`
	echo "${config}"
}

function _gitcli_current_branch() {
	branch=`git branch | grep \* | cut -d ' ' -f2`
	echo "${branch}"
}

function _gitcli_create() {

	_gitcli_process "Creating new branch ${newBranch} from ${srcBranch}"

	newBranch=${1}
	srcBranch=${2}

	# first, check if we already have a branch with same name
	if [[ ! -z `git branch --list ${1}` ]]; then
		_gitcli_notice "Branch ${newBranch} already exists"
		return 0
	fi

	git branch "${newBranch}" ${srcBranch}
}

function _gitcli_checkout() {

	fromBranch=`_gitcli_current_branch`
	toBranch=${1}

	_gitcli_process "${fromBranch} => ${toBranch}"

	# check to see if there are things to be stashed
	hasChanges=`git status -s`
	if [[ ! -z "${hasChanges}" ]]; then
		_gitcli_process "Stashing changes"
		# if has something to stash, stash them and store the commit in config
		git add -A
		git stash
		sha=`git reflog show stash --pretty=format:%H | head -1`
		git config "branch.${fromBranch}.laststash" "${sha}"
	fi

	# store fromBranch as recent branch now and checkout toBranch
	_gitcli_process "Checking out ${toBranch}"
	git config story.mostrecent "${fromBranch}"
	git checkout ${toBranch}

	# if there is last stash for the switched branch, pop that out
	laststash=`_gitcli_get_config "branch.${toBranch}.laststash"`
	if [[ ! -z "${laststash}" ]]; then
		_gitcli_process "Popping out last stash"
		stashIndex=0
		stashes=`git reflog show stash --pretty=format:%H`
		for stash in ${stashes}; do
			if [[ ${stash} == ${laststash} ]]; then
				break
			fi
			((stashIndex++))
		done
		git stash pop "stash@{${stashIndex}}"
		git config "branch.${toBranch}.laststash" ""
	fi
}

function _gitcli_choose_one() {

	choices=${1}

	PS3=">>> Choose a branch to checkout: "
	select choice in "${choices[@]}"
	do
		case ${choice} in
			*)
				echo ${choice}
				break
				;;
		esac
	done
}
