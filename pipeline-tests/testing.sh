sed 's/_suffix$//' data.txt | jq -R -s 'split("\n") | map(select(length > 0))' > output.json


find /path/to/directory -type f -name "*.txt" -exec grep -v '^$' {} + | sed 's/_suffix$//' > combined.txt


sed -n '10,20p' input.txt > output.txt


stages:
  - process

process-first-file:
  stage: process
  script:
    - |
      # Set the directory path
      directory="your_directory_path"
      
      # Get the first file from the directory (sorted by name)
      first_file=$(ls -1 "$directory" | head -n 1)

      # Check if the file exists and process it
      if [ -n "$first_file" ]; then
        echo "Processing first file: $first_file"

        # Write the content of the first file to another file (output.txt)
        cat "$directory/$first_file" > output.txt

        echo "Content has been written to output.txt"
      else
        echo "No files found in the directory."
      fi
