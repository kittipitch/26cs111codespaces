#!/bin/bash
# Run this once to save your CS111 workspace to your own GitHub repo.
set -e

USERNAME=$(gh api user -q .login)
REPO_NAME="cs111-${USERNAME}"

rm -rf /workspaces/26cs111codespaces/.git
cd /workspaces/26cs111codespaces
git init
git config user.name "$(gh api user -q .name)"
git config user.email "${USERNAME}@users.noreply.github.com"
git add .
git commit -m "Initial CS111 workspace"
gh repo create "$REPO_NAME" --private --source=. --remote=origin --push

echo ""
echo "✅ Done! Your work is saved at: https://github.com/${USERNAME}/${REPO_NAME}"
