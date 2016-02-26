find . -name .git -print0 | xargs -0 dirname | sort | cat > temp~
base_dir=$(pwd)
OIFS=$IFS
IFS=$(echo -en "\n\b")
while read -r line || [[ -n "$line" ]]; do
	cd $base_dir
	cd $line
	pwd
	(git remote -v)>>D:/GitHub/output~
	echo ""
done < temp~
IFS=$OIFS
cd $base_dir
cat output~>all-remotes.txt
rm output~
rm temp~
