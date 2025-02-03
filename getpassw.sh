#!/bin/bash

# This script retrieves an password from the macOS keychain.
# It ensures that only supported keys, as defined in the config.sh file, are read and loaded.
# One of the use cases is to load API keys for large language models (LLMs).

SCRIPT_DIR=$(dirname "$(realpath "$0")")
source "$SCRIPT_DIR/config.sh"

# Function to retrieve an API key from the macOS keychain
getpassw() {
    local KEY_NAME=$1

    # Check if KEY_NAME is empty
    if [ -z "$KEY_NAME" ]; then
        echo "Error: KEY_NAME is required."
        return 1
    fi

    # Check if KEY_NAME is in the list of supported keys
    if [[ ! " ${SUPPORTED_KEYS[@]} " =~ " ${KEY_NAME} " ]]; then
        echo "Error: Invalid KEY_NAME. Supported values are:"
        printf "%s\n" "${SUPPORTED_KEYS[@]}"
        return 1
    fi

    # Retrieve the password from the keychain
    security find-generic-password -w -s "$KEY_NAME"
}

