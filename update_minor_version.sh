#!/bin/bash

# Get the current version from Maven
current_version=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
echo "Current version: $current_version"

# Extract major, minor, and patch versions
major=${current_version%%.*}            # Extracts major version (first number)
rest=${current_version#*.}               # Removes major version from the string
minor=${rest%%.*}                        # Extracts minor version (second number)
patch=${rest#*.}                         # Gets the remaining part (patch)

# Increment the minor version
new_minor=$((minor + 1))
new_version="${major}.${new_minor}.0"

# Output the new version
echo "New version: $new_version"

# Set the new version in Maven
mvn versions:set -DnewVersion=$new_version
