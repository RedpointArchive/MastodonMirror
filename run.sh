#!/bin/bash

set -e
set -x

source ve/bin/activate

# write out the credentials
echo -n $MASTODON_USER_CRED > /srv/t2m_$MASTODON_USER@${MASTODON_DOMAIN}_creds.txt
echo -n $MASTODON_DOMAIN_CRED > /srv/t2m_${MASTODON_DOMAIN}_clientcred.txt
cat > /srv/conf.yaml <<EOF
consumer_key: "$TWITTER_CONSUMER_KEY"
consumer_secret: "$TWITTER_CONSUMER_SECRET"
access_token_key: "$TWITTER_ACCESS_TOKEN_KEY"
access_token_secret: "$TWITTER_ACCESS_TOKEN_SECRET"
EOF

# mark all as done before starting
/srv/t2m one $TWITTER_USERNAME -m $MASTODON_USER@$MASTODON_DOMAIN -o -r

while [ 0 -eq 0 ]; do
  # forward all tweets
  /srv/t2m all -r

  # sleep two minutes
  sleep 120
done