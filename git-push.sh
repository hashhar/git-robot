# Our functions to tell us about the state of our repo
function unstaged_changes() {
	worktree=${1%/*};
	git --git-dir="$1" --work-tree="$worktree" diff-files --quiet --ignore-submodules --
}

function uncommited_changes() {
	worktree=${1%/*};
	git --git-dir="$1" --work-tree="$worktree" diff-index --cached --quiet HEAD --ignore-submodules --
}

# Our function to push
# REVIEW: Push quietly or with progress
function push() {
	worktree=${1%/*};
	git --git-dir="$1" --work-tree="$worktree" push
}

if [[ $# -lt 1 ]]
then
	echo "Enter the base path in which to look for repositories to run the command (git push) on:"
	read base
	echo "Enter the maximum search depth:"
	read depth
	depth=`expr $depth + 1`
else
	base=$1
	depth=`expr $2 + 1`
fi
# Store the old IFS to restore it later
OIFS=$IFS
# Set IFS to newlines (yes that is some *nix stupidity to make \n\b represent newlines)
IFS=$(echo -en "\n\b")
# Iterate through all directories according to our criteria
for gitdir in `find $base -maxdepth $depth -type d -name .git`;
do
	worktree=${gitdir%/*};
	# REVIEW: Should we check for the unstaged or uncommitted changes or just push the damn stuff?
	# Use if elif because we want to prompt for other stuff only in case of unstaged or uncommitted changes
	if ! unstaged_changes $gitdir
	then
		echo "Unstaged changes in    $gitdir"
		echo "Do you want to push without committing the changes? (Default is yes) [Y/n]:"
		read choice
		# If they don't want to, we can't force them to. Instead we move on to the next repo
		if [ "$choice" == "n" -o "$choice" == "N" ]
		then
			echo "Skipping over $gitdir"
			continue
		# We want to be sure they opted for it and it was not their cat running across the keyboard
		elif [ "$choice" == "y" -o "$choice" == "Y" ]
		then
			push $gitdir
		fi
	elif ! uncommited_changes $gitdir
	then
		echo "Uncommitted changes in $gitdir"
		echo "Do you want to push without committing the changes? (Default is yes) [Y/n]:"
		read choice
		# If they don't want to, we can't force them to. Instead we move on to the next repo
		if [ "$choice" == "n" -o "$choice" == "N" ]
		then
			echo "Skipping over $gitdir"
			continue
		# We want to be sure they opted for it and it was not their cat running across the keyboard
		elif [ "$choice" == "y" -o "$choice" == "Y" ]
		then
			push $gitdir
		fi
	# If everything is fine, push the stuff without asking anything
	else
		push $gitdir
	fi
done
IFS=$OIFS
