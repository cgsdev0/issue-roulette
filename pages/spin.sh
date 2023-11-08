
REPO_NAME="${QUERY_PARAMS[name]}"
REPO_OWNER="${QUERY_PARAMS[owner]}"
LABELS="${QUERY_PARAMS[labels]}"

if [[ -z "$LABELS" ]]; then
  URL="https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/issues?per_page=100&sort=updated&direction=desc"
else
  URL="https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/issues?per_page=100&sort=updated&direction=desc&labels=$(urlencode "$LABELS")"
fi
ISSUE="$(curl -SsL \
-H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer ${SESSION[access_token]}" \
-H "X-GitHub-Api-Version: 2022-11-28" \
"$URL" \
| jq -c '.[] | select(.pull_request == null) | { comments, created_at, body, reactions, html_url, title, labels: .labels | map(.name) }' | shuf -n1)"

if [[ -z "$ISSUE" ]]; then
  echo "No issues found with those labels."
else
  TITLE="$(echo "$ISSUE" | jq -r .title)"
  BODY="$(echo "$ISSUE" | jq -r .body | sed 's/</&lt;/g' | pandoc -f markdown -)"
  URL="$(echo "$ISSUE" | jq -r .html_url)"
  htmx_page <<-EOF
    <a target="_blank" href="${URL}"><h3>${TITLE}</h3></a>
    <div>${BODY}</div>
EOF
fi