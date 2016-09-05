OIFS=$IFS
IFS=$(echo -en "\n\b")
while read -r line || [[ -n "$line" ]]; do
	cd $line
	git pull
done < outdated-repos.txt
IFS=$OIFS
