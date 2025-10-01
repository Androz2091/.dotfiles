#!/bin/bash
# Usage: ./upload.sh file.err

BASE_URL="https://cloud.androz2091.fr"
USERNAME="admin"

if [ -z "$1" ]; then
  echo "Usage: $0 <file-to-upload>"
  exit 1
fi

FILE_PATH="$1"
FILE_NAME=$(basename "$FILE_PATH")

# Ask for password securely
read -s -p "Password for $USERNAME: " PASSWORD
echo

# 1. Get API token (plain text, not JSON)
TOKEN=$(curl -s -X POST "$BASE_URL/api/login" \
  -H "Content-Type: application/json" \
  -d "{\"username\":\"$USERNAME\",\"password\":\"$PASSWORD\"}")

if [ -z "$TOKEN" ]; then
  echo "❌ Login failed. No token returned."
  exit 1
fi

echo "✅ Logged in. Token acquired."

# 2. Upload file to root folder
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -X POST \
  "$BASE_URL/api/resources/$FILE_NAME" \
  -H "X-Auth: $TOKEN" \
  -H "Content-Type: text/plain" \
  --data-binary @"$FILE_PATH")

if [ "$RESPONSE" -eq 200 ] || [ "$RESPONSE" -eq 201 ]; then
  echo "✅ File '$FILE_NAME' uploaded successfully to root."
else
  echo "❌ Upload failed. HTTP status: $RESPONSE"
fi
