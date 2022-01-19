#!/bin/zsh
if [ -z "$1" ]
  then
    echo "you so dumb"
    exit 1
fi
counter=0
subreddit=$1
curl -s -A "titles" https://www.reddit.com/r/${subreddit}/top.json | \
        jq '.data.children |.[] | .data.title,.data.id,.data.stickied' | \
        while read -r TITLE; do
             read -r  ID 
             read -r  PINNED
              ((counter++))
             temp="${ID%\"}"
             temp="${temp#\"}"
             ID=$temp
             if  ! $PINNED  
             then
                  if [ ${#TITLE} -lt 105 ]
                  then
                    . ./comment.sh ${ID} ${subreddit} ${TITLE}
                  fi
             fi 
        done
