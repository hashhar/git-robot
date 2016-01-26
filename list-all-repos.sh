find . -name .git -print0 | xargs -0 dirname | sort>all-repos.txt
