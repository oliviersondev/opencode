#!/usr/bin/env bash
set -euo pipefail

current_branch=$(git branch --show-current)
target_branch="${1:-}"
second_branch="${2:-}"

if [ -z "$target_branch" ]; then
  target_branch="main"
  if ! git rev-parse --verify main >/dev/null 2>&1; then
    target_branch="master"
  fi
fi

if [ -n "$second_branch" ]; then
  source_branch="$target_branch"
  target_branch="$second_branch"
else
  source_branch="$current_branch"
fi

if [ "$source_branch" = "$target_branch" ]; then
  echo "Error: source and target are the same branch ($source_branch). Run from a feature branch or pass two different branches."
  exit 1
fi

if ! git rev-parse --verify "$source_branch" >/dev/null 2>&1; then
  echo "Error: Branch $source_branch not found"
  exit 1
fi

if ! git rev-parse --verify "$target_branch" >/dev/null 2>&1; then
  echo "Error: Branch $target_branch not found"
  exit 1
fi

merge_base=$(git merge-base "$target_branch" "$source_branch")

echo "Comparing: $source_branch → $target_branch"
echo "=================================="
echo ""

echo "Commits since divergence:"
git log --oneline "$target_branch..$source_branch" | head -15
echo ""

echo "Files modified:"
git diff --name-only "$merge_base..$source_branch" | head -20
echo ""

echo "Diff summary:"
git diff --stat "$merge_base..$source_branch"
echo ""

echo "Potential conflicts:"
git merge-tree "$merge_base" "$target_branch" "$source_branch" 2>/dev/null | grep -E "^<<<<<|^=====>|^>>>>>" | wc -l | xargs -I {} echo "Found {} conflict markers"
echo ""

echo "Full diff:"
git diff "$merge_base..$source_branch"
