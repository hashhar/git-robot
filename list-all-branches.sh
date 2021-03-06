find . -name .git -print0 | xargs -0 dirname | sort | cat > temp~
base_dir=$(pwd)
rm $base_dir/all-branches.txt
OIFS=$IFS
IFS=$(echo -en "\n\b")
while read -r line || [[ -n "$line" ]]; do
	cd $base_dir
	cd $line
	pwd
	pwd>>$base_dir/all-branches.txt
	(git branch --list --all)>>$base_dir/all-branches.txt
	# git fetch --all -v --dry-run
	# git pull --dry-run | grep -q -v 'Already up-to-date.' && changed=1
	echo ""
done < temp~
IFS=$OIFS
cd $base_dir
rm temp~
