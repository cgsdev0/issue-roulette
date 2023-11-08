
CURL_RESPONSE="$(curl -Ss -X POST "https://github.com/login/oauth/access_token?client_id=${CLIENT_ID}&client_secret=${CLIENT_SECRET}&code=${QUERY_PARAMS[code]}&redirect_uri=http://localhost:3035/oauth")"

while read -r -d '&' line; do
  FORM_DATA["${line%%=*}"]=$(urldecode "${line#*=}")
done <<< "${CURL_RESPONSE}&"

ACCESS_TOKEN="${FORM_DATA[access_token]}"

SESSION[access_token]="$ACCESS_TOKEN"

save_session
