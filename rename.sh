#!/bin/bash

for file in */ .*/ ; do echo "$file is a directory"; done

git filter-branch --env-filter '
WRONG_EMAIL="slavomir.kuzma@gmail.com"
NEW_NAME="Slavomir"
NEW_EMAIL="jahman@.sk"

if [ "$GIT_COMMITTER_EMAIL" = "$WRONG_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$NEW_NAME"
    export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$WRONG_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$NEW_NAME"
    export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags