# t2m-docker

_Automatically copy your Twitter posts to Mastodon._

This is a Docker image which copies your Twitter posts to Mastodon in near real-time, including the content of retweets. It requires a bit of setup as you need to obtain OAuth credentials for both your Twitter account and your Mastodon account.

## Usage

To set up all the required credentials, run this command:

```
docker run -it --rm redpointgames/t2m-docker setup.sh
```

This will walk you through the set up process and tell you the real Docker command you need to run on a server in order to run t2m-docker.

