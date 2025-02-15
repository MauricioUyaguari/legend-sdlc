read -r -a NAMES <<< "$(jq -r '.peopleList | map(.name) | join(" ")' data.json)"
