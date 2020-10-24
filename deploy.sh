#!/usr/bin/env sh 

set -e 

npm run build 

cd dist 

git init
git add -A 
git commit -m 'deploy'

git push -f https://github.com/claraj/vue-week-3-student-sign-in master:gh-pages

cd - 