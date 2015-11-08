# Our function to pull
function pull() {
	worktree=${1%/*};
	git --git-dir="$1" --work-tree="$worktree" pull
}

if [ $@ -lt 1 ]
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
	pull $gitdir
done
IFS=$OIFS
