# headers

REPO="${QUERY_PARAMS[repo]}"
[[ "$REPO" =~ https://github.com/([^/]*)/([^/?]*).* ]]
REPO_NAME="${BASH_REMATCH[2]}"
REPO_OWNER="${BASH_REMATCH[1]}"

header HX-Redirect "/$REPO_OWNER/$REPO_NAME"
end_headers
end_headers
