# t2m-docker

_Automatically copy your Twitter posts to Mastodon._

This is a Docker image which copies your Twitter posts to Mastodon in near real-time, including the content of retweets. It requires a bit of setup as you need to obtain OAuth credentials for both your Twitter account and your Mastodon account.

## Usage

If you don't have Docker installed, you can run the setup guide really quickly by opening this project in Google Cloud Shell (you'll need a Google account):

[![Open in Cloud Shell](http://gstatic.com/cloudssh/images/open-btn.png)](https://console.cloud.google.com/cloudshell/open?git_repo=https://github.com/RedpointGames/t2m-docker&page=editor&open_in_editor=GCLOUD-SHELL.md)

Alternatively if you're running Linux or Windows with [Docker](https://www.docker.com/) installed, run this command:

```
docker run -it --rm redpointgames/t2m-docker /srv/setup.sh
```

This will walk you through the set up process and tell you the real Docker command you need to run on a server in order to run t2m-docker.

