#!/bin/bash

# Input file
input_file="dependencies_linear_deduplicated.txt"
output_file="licenses_report.csv"

# Ensure the input file exists
if [[ ! -f "$input_file" ]]; then
  echo "Error: $input_file not found!"
  exit 1
fi

# Clear or create the output file
echo "Package,Subclass,License(s),Package URL" > "$output_file"

# Deduplicate entries by {Package, Subclass}
awk -F, '!seen[$1,$2]++' "$input_file" > deduplicated_input.txt

# Process each unique package
while IFS=, read -r group artifact _; do
  # Skip header line or empty lines
  [[ "$group" == "Package" || -z "$group" ]] && continue

  query_url="https://mvnrepository.com/artifact/$group/$artifact"

  # Print the query URL for reference
  echo "Query URL: $query_url"

  # Fetch the package page from MvnRepository
  response=$(curl -s "$query_url")

  # Extract the license information using sed
  licenses=$(echo "$response" | sed -n 's/.*<span class="b lic">\([^<]*\)<\/span>.*/\1/p' | paste -sd ";" -)

  # Remove trailing semicolon if present
  licenses=$(echo "$licenses" | sed 's/;$//')

  # Handle no license case
  if [[ -z "$licenses" ]]; then
    licenses="No license information found"
    query_url=""
  fi

  # Write to the output file
  echo "$group,$artifact,$licenses,$query_url" >> "$output_file"

  # Print progress
  echo "Processed: $group.$artifact"
done < deduplicated_input.txt

# Remove temporary deduplicated input file
rm deduplicated_input.txt

echo "License check completed. Results saved to $output_file."
