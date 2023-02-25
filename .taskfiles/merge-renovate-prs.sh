#!/bin/bash

refs=$(curl \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer $GITHUB_TOKEN"\
        -H "X-GitHub-Api-Version: 2022-11-28" \
        https://api.github.com/repos/zekker6/helm-charts/pulls | jq -r '.[] | select(.user.login |  contains("renovate[bot]")) | .head.ref')

echo $refs

git fetch --all
set -ex
for ref in $refs; do
  echo checking $ref

  # if contains changes to library charts then skip
  files_diff=$(git diff --name-only origin/main...origin/$ref)
  if echo $files_diff | grep "charts/library"; then
    echo "Skipping $ref"
    continue
  fi

  echo "Merging $ref"
  git checkout $ref
  git pull --rebase

  # Update chart version, app version and artifacthub.io/changes
  # get commit message
  commit_message=$(git log --format=%B -n 1 origin/$ref | awk -F ':' '{print $2}')
  app_version=$(echo $commit_message | awk -F 'to v' '{print $2}')

  chart_file=$(echo $files_diff | sed 's/values.yaml/Chart.yaml/')
  yq -i '.appVersion = "v'$app_version'"' $chart_file

  changes=$(cat << EOF
- kind: changed
  description: $commit_message
EOF
)
  yq -i ".annotations[\"artifacthub.io/changes\"] = \"$changes\"" $chart_file

  version=$(yq -r .version $chart_file | awk -F '.' '{ a = $1; b = $2; c = $3; printf "%d.%d.%d", a,++b,c }')
  yq -i '.version = "'$version'"' $chart_file

  git diff
  git commit -am "chore: bump chart version"
  git push
done
