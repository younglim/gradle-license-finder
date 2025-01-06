#!/bin/bash

# Run the gradle dependencies command and process its output
./gradlew :app:dependencies | \
awk '
  BEGIN { 
    OFS="," 
  }
  {
    # If the line starts with "+---", extract the dependency name and version
    if ($1 ~ /^\+---/) {
      gsub(/\+--- /, "", $0)  # Remove leading "+---"
      gsub(/:/, ",", $0)      # Replace ":" with ","
      print
    }
    # If the line starts with "|    \\---", process similarly
    else if ($1 ~ /^\|    \\---/) {
      gsub(/\|    \\--- /, "", $0)  # Remove leading "|    \---"
      gsub(/:/, ",", $0)            # Replace ":" with ","
      print
    }
  }' | sort | uniq > dependencies_linear_deduplicated.txt

# Notify the user
echo "Deduplicated dependencies saved to dependencies_linear_deduplicated.txt"
