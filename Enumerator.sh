#!/usr/bin/zsh

# Prompt user for a domain
echo -n "Enter the target domain: "
read target
echo "=================================================================================="

# Directory to store subdomain results
output_dir="Subdomain_enum_results"
mkdir -p "$output_dir"

# Enumerating subdomain using subfinder
subfinder_output="$output_dir/subdomain.txt"
subfinder -d "$target" -o "$subfinder_output"

# Enumerating subdomain using assetfinder
# assetfinder_output="$output_dir/assetfinder.txt"
# assetfinder -subd-only "$target" > "$assetfinder_output"
# echo "__________________________________________________________________________________"

# Enumerating subdomain using findomain
findomain_output="$output_dir/findomin.txt"
findomain -t "$target" > "$findomain_output"
echo "_____________________________________________________________________________________________________________________________________"

# Combine and sort the results
Combined_output="$output_dir/combined.txt"
cat "$subfinder_output" "$findomain_output" | sort -u > "$Combined_output"

# Clean up individual output files
rm -r "$subfinder_output" "$findomain_output"

echo "Subdomain enumeration completed. Results saved to '$Combined_output'."
echo "********************************* This script has been created by Dhananjay Pathak ****************************************************"
