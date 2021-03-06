ERROR="$(tput setaf 1)ERROR: $(tput sgr0)"
PROCESS="$(tput setaf 5)PROCESSING: $(tput sgr0)"
SUCCESS="$(tput setaf 2)SUCCESS: $(tput sgr0)"
NOTICE="$(tput setaf 4)NOTICE: $(tput sgr0)"

function cd() {
    builtin cd "$@" && ls
}

function circlefix() {
	touch a
	git add a
	git ci -m "Fix circle build failure: add a"
	git rm a
	git ci -m "Fix circle build failure: remove a"
}

function dropdb() {
	if [[ -z $1 ]]; then
		echo $ERROR"Incorrect Argument"
		return 1
	fi
	mysql -h 10.11.12.13 -u kchu -ptest -e "DROP DATABASE \`$1\`"
}

function evimrc {
	sessionName="$HOME/.vim/sessions/vimrc.vim"
	cd $HOME/.vim
	if [[ -a $sessionName ]]; then
		vim . -S $sessionName -c "cd $HOME/.vim"
	else
		vim -c "cd $HOME/.vim" -c "Obsession $sessionName"
	fi
}

function findfile() {
    find . -name '*'$1'*'
}

function git() {

	customCmds=("s" "story")
	if [[ ${customCmds[(i)$1]} -le ${#customCmds} ]]; then
		gitcli "$@"
	else
		/usr/bin/git "$@"
	fi
}

function gitcob7() {
    if [[ -z $1 ]]; then
        echo $ERROR"Incorrect Argument"
        return 1
    fi

    /usr/bin/git fetch ActiveCampaign
    /usr/bin/git co -b $1 ActiveCampaign/version-8.1
    /usr/bin/git push origin --set-upstream $1
}

function gnewstory() {

	zparseopts -D -- b:=newBranch -branch:=newBranch f+:=fromBranch -fromBranch+:=fromBranch

	# fromBranch=("${(@)fromBranch:#--fromBranch}")
	# fromBranch=("${(@)fromBranch:#-f}")

	if [[ -z $newBranch[2] ]]; then
		echo Usage: $(basename "$0") "-b NEWBRANCH [-f FROMBRANCH]"
		return 1
	fi

	newBranch=$newBranch[2]
	fromBranch=$fromBranch[2]

	if [[ ! -z $fromBranch && $fromBranch == 'goal' ]]; then
		fromBranch='feature-7.9-goal-reporting.1'
	else
		fromBranch='version-8.1'
	fi

	# Get confirmation before proceeding
	echo
	vared -p "Creating new branch $newBranch from $(tput setaf 3)$fromBranch$(tput sgr0). Continue?(nY) " -c userInput
	case $userInput in
		"Y")
			unset userInput
			;;
		*)
			unset userInput
			return 0
			;;
	esac

	# typeset -A helper
	# helper=($seq 1 ${#foptions})

	# for item in ${(@v)helper}
	# do
	# 	print ${foptions[$item]}
	# done

	currentDir=$(pwd)

	_echo_progress "Creating ember app branch"
	builtin cd ~/vagrant/dev/ember-app
	_git_create_branch "$newBranch" "$fromBranch"

	_echo_progress "Creating hosted branch"
	builtin cd ~/vagrant/dev/Hosted
	_git_create_branch "$newBranch" "$fromBranch"

	builtin cd "$currentDir"
}

function gitbrd () {

	branches=($(/usr/bin/git br | grep -v '\*' | awk '{print $1}'))

	echo "\n$(tput setaf 3)Choose branches to delete: $(tput sgr0)\n"

	index=1
	for branch in $branches
	do
		echo "    $index) $branch"
		((index++))
	done

	echo
	vared -p "$(tput setaf 3)    >>> " -c userInput

	# split input selections into array
	selectedBranches=("${(@s/ /)userInput}")

	# unset user input so that previous input does not show up in next call
	unset userInput

	# for each selected branch, delete it
	for choice in $selectedBranches
	do
		branch=$branches[choice]
		echo "${PROCESS}Deleting $branch"
		git br -d "$branch"
	done
}

function gitbrD () {

	branches=($(/usr/bin/git br | grep -v '\*' | awk '{print $1}'))

	echo "\n$(tput setaf 3)Choose branches to delete: $(tput sgr0)\n"

	index=1
	for branch in $branches
	do
		echo "    $index) $branch"
		((index++))
	done

	echo
	vared -p "$(tput setaf 3)    >>> " -c userInput

	# split input selections into array
	selectedBranches=("${(@s/ /)userInput}")

	# unset user input so that previous input does not show up in next call
	unset userInput

	# for each selected branch, delete it
	for choice in $selectedBranches
	do
		branch=$branches[choice]
		echo "${PROCESS}Deleting $branch"
		git br -D "$branch"
	done
}

function gitcobr () {

	if [[ ! -z $1 ]]; then
		branches=($(/usr/bin/git br | grep -v '\*' | awk '{print $1}' | grep -iE $1))
	else
		branches=($(/usr/bin/git br | grep -v '\*' | awk '{print $1}'))
	fi

    PS3='Choose branch to checkout: '
    select branch in "${branches[@]}"
    do
        case $branch in
            *)
				_git_switch_branch "$branch"
                break
                ;;
        esac
    done
}

function gitcobra () {

	if [[ ! -z $1 ]]; then
		branches=($(/usr/bin/git br | grep -v '\*' | awk '{print $1}' | grep -iE $1))
	else
		branches=($(/usr/bin/git br | grep -v '\*' | awk '{print $1}'))
	fi

	PS3='Choose branch to checkout: '
	select branch in "${branches[@]}"
	do
		case $branch in
			*)
				currentDir=$(pwd)
				_echo_progress "Switching ember app branch"
				builtin cd ~/vagrant/dev/ember-app
				_git_switch_branch "$branch"
				_echo_progress "Switching Hosted branch"
				builtin cd ~/vagrant/dev/Hosted
				_git_switch_branch "$branch"
				builtin cd "$currentDir"
				break
				;;
		esac
	done
}

function gitrmnew() {
    newFiles=( $(/usr/bin/git st . | awk '/\?\?/ {print $2}') )
    filesToDelete=""
    for i in $newFiles
    do
        rm -rf $i
    done
}

function gpc7() {
	git fetch ActiveCampaign
	git pull ActiveCampaign master
}

function gp8() {
	git fetch ActiveCampaign
	git pull ActiveCampaign version-8.1
}

function gpr8() {
	git fetch ActiveCampaign
	git pull ActiveCampaign feature-8.1-contact-automation-report.1
}

function gpp8() {
	git fetch ActiveCampaign
	git pull ActiveCampaign feature-8.1-optimize-pusher
}

function note() {

	todoFileName="scratch-note.md"

	if [[ ! -z "$1" ]]; then
		# checking if filename is specified in CLI argument
		todoFileName="$1.md"
	else
		currentBranch=$(_git_current_branch)
		echo $currentBranch
		pattern='^(feature|bugfix)/([0-9]+)(-.*)?'
		if [[ "$currentBranch" =~ "$pattern" ]]
		then
			# create ticket-specific note if in git repo
			ticketNumber=$match[2] 
			todoFileName="note-$ticketNumber.md"
		fi
	fi

	vim "$HOME/.vim/notes/$todoFileName"
}

function tt() {
    if [[ -z $1 ]]; then
        echo $ERROR"Incorrect Argument"
        return 1
    fi
    existingSession=( $(tmux list-sessions | awk -F: '{print $1}' | grep $1) )

    # if such session doesn't exist, creat new session
    if [[ -z $existingSession  ]]; then
        tmux new -s $1
    else
    	if [[ $#existingSession -eq 1 ]] && [[ $existingSession == $1 ]]; then
            tmux attach-session -t $1
        else
        	PS3='Choose session to create/attach: '
        	select sessionName in "${existingSession[@]}" "$1"
        	do
            	case $sessionName in
                	"$1")
                    	tmux new -s $1
                    	break
                    	;;
                	*)
                    	tmux attach-session -t $sessionName
                    	break
                    	;;
            	esac
        	done
    	fi
    fi
}

#
# Starts vim with session automatically determined by git branch
#
function viim_i_worship_you_forever_you_are_my_god() {
	pattern1='^(feature|bugfix)/([0-9]+)(-.*)?'
	currentBranch=$(_git_current_branch)
	currentDir=$(basename $(pwd))

	if [[ "$currentBranch" =~ "$pattern1" ]]
	then
		ticketNumber=$match[2] 
		if [[ "$currentDir" =~ "^ember" ]]; then
			filename="ember-$ticketNumber.vim"
		elif [[ "$currentDir" =~ "^[hH]osted" ]]; then
			filename="hosted-$ticketNumber.vim"
		fi
	else
		currentBr="$(echo $currentBranch | sed -E 's_([^ ]*)/([^ ]*)_\1-\2_')"
		filename="${currentDir}-${currentBr}.vim"
	fi

	filepath="$HOME/.vim/sessions/$filename"

	echo "Running vim with session: $filepath"

	if [[ -a $filepath ]]
	then
		vim -S $filepath
	else
		vim -c "Obsession $filepath"
	fi
}

function vssh() {
	ssh vagrant@10.11.12.13
}

function behat() {
	if [[ -z $1 ]]; then
		echo $ERROR"Incorrect Argument"
		return 1
	fi
	ssh -t vagrant@10.11.12.13 'cd /vagrant/dev/Hosted; ./vendor/bin/behat' "$1"
}

function wm() {

	if [[ -z $1 ]]; then
		echo $ERROR"Incorrect Argument"
		return 1
	fi

	/usr/local/Cellar/watchman/4.7.0/bin/watchman-make -p \
		ac_global/* \
		api/3/* \
		features/bootstrap/* \
		admin/classes/* \
		admin/functions/* \
		admin/api.php \
		"$1" \
		-t "$1"
}

function pr() {

	URL=""
	BRANCH=$(_git_current_branch) 
	if [[ "${PWD##*/}" == "hosted" ]]; then
		URL="https://github.com/ActiveCampaign/Hosted/compare/feature-8.3-tag-category-field-group.4...kidonchu:$BRANCH?expand=1"
	else
		URL="https://github.com/ActiveCampaign/ember-app/compare/feature-8.3-tag-category-field-group.4...kidonchu:$BRANCH?expand=1"
	fi
	if [[ ! -z "$BRANCH" ]]
	then
		open "$URL"
	fi
}

#####################
### private functions
#####################
_git_create_branch() {
	newBranch=$1
	baseBranch=$2
	currentBranch=$(git br | grep '\*' | awk '{print $2}')
	_echo_progress "$currentBranch => $branch"
	git add .
	_echo_progress 'Saving changes to stash'
	git stash save "$currentBranch"
	
	_echo_progress 'Creating target branch'
	git fetch ActiveCampaign
	git co -b "$newBranch" "ActiveCampaign/$baseBranch"
	git push origin --set-upstream "$newBranch"
}

_git_switch_branch() {
	branch=$1
	currentBranch=$(git br | grep '\*' | awk '{print $2}')
	_echo_progress "$currentBranch => $branch"
	git add .
	_echo_progress 'Saving changes to stash'
	git stash save "$currentBranch"
	_echo_progress 'Checking out target branch'
	git checkout $branch
	# check if there is any stash from previous edits
	_echo_progress 'Restoring stashed changes'
	_git_restore_stashed_changes "$branch"
}

_git_restore_stashed_changes() {
	# @TODO[kchu] Make sure to handle multiple stashed entries case
	branch=$1
	hasStash=$(git stash list |grep "$branch")
	if [[ ! -z "$hasStash" ]]; then
		stashed=$(echo "$hasStash" | awk -F':' '{print $1}')
		if [[ ! -z "$stashed" ]]; then
			git stash pop "$stashed"
		fi
	fi
}

_git_current_branch() {
	echo $(git br 2&> /dev/null | grep '\*' | awk '{print $2}')
}

_echo_progress() {
	echo
	echo "$PROCESS: "$1
}

# vim: set ft=zsh:
