#!/bin/bash

# Substitute variables here
USER_NAME="hashhar"
ACCESS_TOKEN="<API KEY>"
URL="https://api.github.com/users/${ORG_NAME}/repos?access_token=${ACCESS_TOKEN}"

curl ${URL} | ruby -rjson -e 'JSON.load(STDIN.read).each {|repo| %x[git clone #{repo["ssh_url"]} ]}'
