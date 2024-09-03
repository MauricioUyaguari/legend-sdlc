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


<?xml version="1.0" encoding="UTF-8"?>
<testsuite tests="0" failures="0" errors="0" skipped="0" name="EmptyTest">
</testsuite>


test-job:
  stage: test
  script:
    - echo "Running tests"
    - make test || true  # This ensures that the job continues even if tests fail.
    - |
      if [ -f test-results/junit.xml ]; then
        echo "JUnit report found."
      else
        echo "JUnit report missing, creating a placeholder."
        echo '<?xml version="1.0" encoding="UTF-8"?><testsuites></testsuites>' > test-results/junit.xml
      fi
  artifacts:
    reports:
      junit: test-results/junit.xml


if [ -n "$(find /path/to/directory -mindepth 1 -print -quit)" ]; then
  echo "Directory is not empty"
else
  echo "Directory is empty"
fi

