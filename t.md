stages:
  - process_names

process_names_job:
  stage: process_names
  script:
    - NAMES=$(jq -c '.peopleList | map(.name)' data.json)
    - readarray -t NAME_ARRAY < <(echo "$NAMES" | jq -r '.[]')
    - for name in "${NAME_ARRAY[@]}"; do
        echo "Processing $name";
      done
