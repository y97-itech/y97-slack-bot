#!/bin/bash
curl https://cli-assets.heroku.com/install.sh | sh

cat > ~/.netrc << EOF
machine api.heroku.com
  login $HEROKU_LOGIN
  password $HEROKU_AUTH_TOKEN
EOF


# Add heroku.com to the list of known hosts
if [ ! -d ~/.ssh ]; then
  mkdir ~/.ssh
fi

ssh-keyscan -H heroku.com >> ~/.ssh/known_hosts

