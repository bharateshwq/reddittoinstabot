#!/bin/zsh
temp="${3%\"}"
temp1="${temp#\"}"
#temp 1 is title
echo $temp1 
curl -s -A "comments" https://www.reddit.com/r/${2}/comments/${1}.json | \
                    jq  '.[1] | .data.children | .[0] |.data.body  '| \
while read -r COMMENT ; do
cmt="${COMMENT%\"}"
COMMENT="${cmt#\"}"
python imageCreator.py $temp1
echo "image created SUCCESSFULLY \n"
#sleep 900s
python imgPost.py ${COMMENT}
if [[ $? = 0 ]]; then
          echo "image posted SUCCESSFULLY"
else
     echo "ERROR:((((("
fi
rm config/test.er951_uuid_and_cookie.json
echo $counter
done
