
REPO_OWNER="${PATH_VARS[owner]}"
REPO_NAME="${PATH_VARS[name]}"

htmx_page <<-EOF
<div class="labelbox">
$(curl -SsL \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${SESSION[access_token]}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/labels" \
  | jq -r '.[] | [.name, .color] | @tsv' \
  | awk -F'\t' 'BEGIN {OFS = FS} { print "<label class=\"label\" for=\"label-"$1"\"><input type=checkbox id=\"label-"$1"\" name=\"labels\" value=\""$1"\" /><span style=\"border-color: #"$2"\">"$1"</span></label>" }')
</div>
EOF