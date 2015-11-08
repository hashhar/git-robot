[![Stories in Ready](https://badge.waffle.io/hashhar/git-robot.png?label=ready&title=Ready)](https://waffle.io/hashhar/git-robot)
[![Stories in Progress](https://badge.waffle.io/hashhar/git-robot.png?label=in%20progress&title=In%20Progress)](https://waffle.io/hashhar/git-robot)

# Git Robot

Ever felt the need to be able to run a git command on all of the repositories on your system (or a select few within a directory)? Then this is for you.

# Installation

Really?
```
git clone https://github.com/hashhar/git-robot.git
cd git-robot
./git-command                // where git-command is one of the scripts in the repository
```

# Usage

```bash
./git-status.sh D:/GitHub/Forks 2  # This will run git status
./git-push.sh D:/GitHub/Forks 2  # This will run git push
./git-pull.sh D:/GitHub/Forks 2 # This will run git pull
# All of the above will run commands on repositories inside D:/GitHub/Forks and will search only 2 subdirectories deep
```

# How to Contribute

- You should open issues for bugs, feature requests (check the roadmap before posting a request) or even typos.
- Feel free to suggest better ways of doing stuff.
- All the work you do should be on a clone/fork of the **master branch**. Do all the work on a separate branch, not the master.
- Submit a pull request if you are interested (but only after opening an issue please).

# Roadmap

- [x] Status
- [x] Push
- [x] Pull
- [ ] Commit
- [ ] Add unstaged changes
- [ ] Add and commit
- [ ] Delete merged branches
- [ ] Any custom command entered by the user

# My Throughput

[![Throughput Graph](https://graphs.waffle.io/hashhar/git-robot/throughput.svg)](https://waffle.io/hashhar/git-robot/metrics)
