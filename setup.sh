#!/bin/bash

set -e

source ve/bin/activate

TWITTER_APP_NAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)

echo "-- Welcome to the t2m-docker setup! --"
echo
echo "This will guide you through the steps to set up automatic "
echo "copying of your Twitter posts to your Mastodon account."
echo
echo "First up, head to https://apps.twitter.com/app/new in your "
echo "web browser, and enter the following details without quotes:"
echo
echo "Name: 't2m ($TWITTER_APP_NAME)'"
echo "Description: 't2m (Twitter to Mastodon)'"
echo "Website: 'https://t2m-docker.local/'"
echo "Callback URL: (leave empty)"
echo "Check 'Yes, I have read and agree to the Twitter Developer Agreement.'"
echo "Click 'Create your Twitter application'"
echo 
echo "Once you have completed these steps, hit Enter."

read

echo
echo "-- Configure access permissions --"
echo 
echo "On the next page, under the 'Details' tab under the 'Application Settings' "
echo "section, click 'modify app permissions' next to 'Access level' and "
echo "change it to read-only."
echo
echo "Once you have completed this step, hit Enter."
echo

read

echo
echo "-- Create access token --"
echo
echo "Once this setting is saved, click the tab 'Keys and Access Tokens', just "
echo "underneath your application name. Then at the bottom of the screen:"
echo
echo "Click 'Create my access token'"
echo
echo "Once you have completed this step, hit Enter."
echo

read

echo
echo "-- Paste in keys and secrets --"
echo
echo "We are almost done with Twitter setup. I just need the "
echo "following values from this page, which you need to paste "
echo "into your terminal:"
echo
echo "- Consumer Key (API Key)"
echo "- Consumer Secret (API Secret)"
echo "- Access Token"
echo "- Access Token Secret"
echo

read -p "Paste or enter the Consumer Key (API Key) now: " TWITTER_CONSUMER_KEY
read -p "Paste or enter the Consumer Secret (API Secret) now: " TWITTER_CONSUMER_SECRET
read -p "Paste or enter the Access Token now: " TWITTER_ACCESS_TOKEN_KEY
read -p "Paste or enter the Access Token Secret now: " TWITTER_ACCESS_TOKEN_SECRET

echo
echo "-- Final steps --"
echo
echo "Finally, what's your Twitter username (without the @ symbol)?"
echo

read -p "Paste or enter your Twitter username: " TWITTER_USERNAME

echo
echo "-- Mastodon setup --"
echo 
echo "Alright! We're all done with Twitter. Now we need to set up the credentials "
echo "for Mastodon."
echo

read -p "What's your Mastodon username (just the username like 'hq', no domain): " MASTODON_USER
read -p "What's the domain of your Mastodon instance (just the domain, like 'mastodon.social'): " MASTODON_DOMAIN

echo

cat >/srv/conf.yaml <<EOF
consumer_key: "$TWITTER_CONSUMER_KEY"
consumer_secret: "$TWITTER_CONSUMER_SECRET"
access_token_key: "$TWITTER_ACCESS_TOKEN_KEY"
access_token_secret: "$TWITTER_ACCESS_TOKEN_SECRET"
EOF

cd /srv
/srv/t2m add $TWITTER_USERNAME $MASTODON_USER@$MASTODON_DOMAIN

MASTODON_USER_CRED=$(cat /srv/t2m_$MASTODON_USER@${MASTODON_DOMAIN}_creds.txt)
MASTODON_DOMAIN_CRED=$(cat /srv/t2m_${MASTODON_DOMAIN}_clientcred.txt)

echo "Run the following Docker command:"
echo
echo -n "docker run --rm "
echo -n "-e TWITTER_USERNAME='$TWITTER_USERNAME' "
echo -n "-e TWITTER_CONSUMER_KEY='$TWITTER_CONSUMER_KEY' "
echo -n "-e TWITTER_CONSUMER_SECRET='$TWITTER_CONSUMER_SECRET' "
echo -n "-e TWITTER_ACCESS_TOKEN_KEY='$TWITTER_ACCESS_TOKEN_KEY' "
echo -n "-e TWITTER_ACCESS_TOKEN_SECRET='$TWITTER_ACCESS_TOKEN_SECRET'"
echo -n "-e MASTODON_USER='$MASTODON_USER' "
echo -n "-e MASTODON_DOMAIN='$MASTODON_DOMAIN' "
echo -n "-e MASTODON_USER_CRED='$MASTODON_USER_CRED' "
echo -n "-e MASTODON_DOMAIN_CRED='$MASTODON_DOMAIN_CRED' "
echo "redpointgames/t2m-docker"