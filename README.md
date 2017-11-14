# t2m-docker

_Automatically copy your Twitter posts to Mastodon._

This is a Docker image which copies your Twitter posts to Mastodon in near real-time, including the content of retweets. It requires a bit of setup as you need to obtain OAuth credentials for both your Twitter account and your Mastodon account.

## Getting Started

If you don't have Docker installed, you can run the setup guide really quickly by opening this project in Google Cloud Shell (you'll need a Google account):

[![Open in Cloud Shell](http://gstatic.com/cloudssh/images/open-btn.png)](https://console.cloud.google.com/cloudshell/open?git_repo=https://github.com/RedpointGames/t2m-docker&page=editor&open_in_editor=GCLOUD-SHELL.md)

Alternatively if you're running Linux or Windows with [Docker](https://www.docker.com/) installed, run this command:

```
docker run -it --rm redpointgames/t2m-docker /srv/setup.sh
```

This will walk you through the set up process and tell you the real Docker command you need to run on a server in order to run t2m-docker.

## After Setup

Once you've completed the setup guide, you'll be given a Docker command to run. This Docker command will run the server that pushes your tweets to Mastodon automatically, so you need to find somewhere suitable to run it. You can:

- Run it on your computer if you have Docker installed. Your tweets will only be forwarded while your computer is running.
- Run in on a cloud VM or VPS server directly. You can run an f1-micro VM (the smallest type) on [Google Cloud](https://cloud.google.com/free/) for free. If you're going with this option, pick Ubuntu and make the boot disk no bigger than 30GB. You might need to install Docker with `apt install -y docker.io`, but then just SSH into the instance and run the command you were given.
- Run it in Kubernetes. A template for a Kubernetes deployment is provided in this repository; you just need to fill in the environment variables based on the Docker command you were given. This is by far the most reliable way of running the server (as Kubernetes will automatically restart it if it fails), but also you need a Kubernetes cluster to run it on. The smallest option here on Google Cloud will set you back about $35 a month for a container cluster with 1 VM.

If you need help or suggestions on where to run it, reach out to [@hq on mastodon.social](https://mastodon.social/@hq).