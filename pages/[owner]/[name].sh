
REPO_OWNER="${PATH_VARS[owner]}"
REPO_NAME="${PATH_VARS[name]}"

htmx_page <<-EOF
  <a href="/"><h1 class="text-blue-500 text-4xl mt-3 mb-3">${PROJECT_NAME}</h1></a>
  <p>Want to contribute to <a href="https://github.com/${REPO_OWNER}/${REPO_NAME}">${REPO_OWNER}/${REPO_NAME}</a>, but don't know where to start? Spin the roulette to find a random issue!</p>
  <h2>Filter by Labels</h2>
  <div hx-get="/labels/${REPO_OWNER}/${REPO_NAME}" hx-trigger="load" hx-swap="outerHTML">Loading...</div>
  <form hx-target="#issue" hx-get="/spin" hx-vals='{"name": "${REPO_NAME}", "owner": "${REPO_OWNER}"}'>
  <div class="signin">
  <button class="spinbtn">

  <svg  class="svg-icon" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M4.06189 13C4.02104 12.6724 4 12.3387 4 12C4 7.58172 7.58172 4 12 4C14.5006 4 16.7332 5.14727 18.2002 6.94416M19.9381 11C19.979 11.3276 20 11.6613 20 12C20 16.4183 16.4183 20 12 20C9.61061 20 7.46589 18.9525 6 17.2916M9 17H6V17.2916M18.2002 4V6.94416M18.2002 6.94416V6.99993L15.2002 7M6 20V17.2916" stroke="#5d41de" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
  <span>Spin!</span>
</button>
</div>
  </form>
  <div id="issue"></div>
EOF
