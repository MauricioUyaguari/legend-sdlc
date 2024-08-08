sed 's/_suffix$//' data.txt | jq -R -s 'split("\n") | map(select(length > 0))' > output.json
