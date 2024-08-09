sed 's/_suffix$//' data.txt | jq -R -s 'split("\n") | map(select(length > 0))' > output.json


find /path/to/directory -type f -name "*.txt" -exec grep -v '^$' {} + | sed 's/_suffix$//' > combined.txt


sed -n '10,20p' input.txt > output.txt
