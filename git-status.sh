# Our functions to tell us about the state of our repo
function unstaged_changes() {
	worktree=${1%/*};
	git --git-dir="$1" --work-tree="$worktree" diff-files --quiet --ignore-submodules --
}

function uncommited_changes() {
	worktree=${1%/*};
	git --git-dir="$1" --work-tree="$worktree" diff-index --cached --quiet HEAD --ignore-submodules --
}

if [ $@ -lt 1 ]
then
	echo "Enter the base path in which to look for repositories to run the command (git status) on:"
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
	if ! unstaged_changes $gitdir
	then
		echo "Unstaged changes in    $gitdir"
	fi

	if ! uncommited_changes $gitdir
	then
		echo "Uncommitted changes in $gitdir"
	fi
done
IFS=$OIFS
