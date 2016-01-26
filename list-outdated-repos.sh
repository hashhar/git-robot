find . -name .git -print0 | xargs -0 dirname | sort | cat > temp~
base_dir=$(pwd)
OIFS=$IFS
IFS=$(echo -en "\n\b")
while read -r line || [[ -n "$line" ]]; do
	cd $base_dir
	cd $line
	pwd
	git remote update
	(git status -uno 2>&1 | grep -i behind && pwd)>>D:/GitHub/output~
	# git fetch --all -v --dry-run
	# git pull --dry-run | grep -q -v 'Already up-to-date.' && changed=1
	echo ""
done < temp~
IFS=$OIFS
cd $base_dir
grep GitHub output~>outdated-repos.txt
rm output~
rm temp~
