rm outdated-LICENCE.txt
find . -name .git -print0 | xargs -0 dirname | sort | cat > temp~
base_dir=$(pwd)
OIFS=$IFS
IFS=$(echo -en "\n\b")
while read -r line || [[ -n "$line" ]]; do
        cd $base_dir
        cd $line
        if grep -q -i Ashhar LICENCE* 2>>D:/GitHub/temp2~; then
            pwd >> D:/GitHub/outdated-LICENCE.txt
            head -n 1 LICENCE* >> D:/GitHub/outdated-LICENCE.txt
            grep -n Ashhar LICENCE* >> D:/GitHub/outdated-LICENCE.txt
            echo $"---------------------------------------" >> D:/GitHub/outdated-LICENCE.txt
        fi
done < temp~
IFS=$OIFS
cd $base_dir
rm temp~
rm temp2~
