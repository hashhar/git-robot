find . -name .git -print0 | xargs -0 dirname | sort | cat > temp~
base_dir=$(pwd)
OIFS=$IFS
IFS=$(echo -en "\n\b")
while read -r line || [[ -n "$line" ]]; do
        cd $base_dir
        cd $line
        if [ -f NUL ]
        then
            rm NUL
        fi
done < temp~
IFS=$OIFS
cd $base_dir
rm temp~
