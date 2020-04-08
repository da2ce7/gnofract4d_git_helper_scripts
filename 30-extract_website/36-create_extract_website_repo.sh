#!/bin/sh
# This script rewrites the Gnofract 4D repo, removing all the files in the website folder.

# Debug Mode
set -x
set -e

if [ ! -d "./gnofract4d_rewrite" ]; then
	echo "canot find './gnofract4d_rewrite' folder"
	exit 1
fi


rm -rf gnofract4d_without_website
mkdir gnofract4d_without_website
cd gnofract4d_without_website

git init

git remote add rewrite_origin ../gnofract4d_rewrite
git fetch --all

git switch --create master rewrite_origin/rewrite_master

# remove website folder from repo
git filter-repo --path website/ --invert-paths --force


#DONE!

