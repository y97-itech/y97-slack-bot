# install heroku
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

cat > ~/.netrc << EOF
machine api.heroku.com
  login $HEROKU_LOGIN
  password $HEROKU_API_KEY
EOF

# Add heroku.com to the list of known hosts
if [ ! -d ~/.ssh ]; then
  mkdir ~/.ssh
fi

ssh-keyscan -H heroku.com >> ~/.ssh/known_hosts

