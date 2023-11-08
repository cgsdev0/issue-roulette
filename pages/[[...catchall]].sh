# headers

REPO="${QUERY_PARAMS[repo]}"
[[ "${PATH_VARS[catchall]}" =~ ^([^/]*)/([^/?]*).*$ ]]
REPO_NAME="${BASH_REMATCH[2]}"
REPO_OWNER="${BASH_REMATCH[1]}"

header Location "/$REPO_OWNER/$REPO_NAME"

end_headers
end_headers

return $(status_code 301)
