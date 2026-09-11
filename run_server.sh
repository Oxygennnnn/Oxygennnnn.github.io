#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
# Use the isolated Bundler from this local setup when it is available.
if [[ -x /private/tmp/homepage-gems/bin/bundle ]]; then
  export GEM_HOME=/private/tmp/homepage-gems
  export GEM_PATH=/private/tmp/homepage-gems
  export PATH="/private/tmp/homepage-gems/bin:$PATH"
fi
bundle check
exec bundle exec jekyll serve --host 127.0.0.1 --port 4000 "$@"
