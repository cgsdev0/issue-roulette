
ACCESS_TOKEN="${SESSION[access_token]}"

curl -SsL \
-H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer $ACCESS_TOKEN" \
-H "X-GitHub-Api-Version: 2022-11-28" \
"https://api.github.com/user/repos?per_page=100" \
| jq -r '.[] | .full_name' \
| awk '{ print "<li><a href=\"/"$1"\">"$1"</a></li>" }'
