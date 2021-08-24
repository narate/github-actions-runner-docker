# GitHub actions runner Docker image

GitHub actions runner docker image with docker in docker and docker-compose

## Build

```
docker-compose build
```

## Run

Add runner - \<repo\>/settings/actions/runners

```
export URL=<REPO_URL>
export TOKEN=<TOKEN>
export NAME=<RUNNER_NAME>
export LABELS=<L1,L2>
docker-compose up -d
docker-compose logs -f
```

[GitHub Actions/Hosting your own runners](https://docs.github.com/en/actions/hosting-your-own-runners)
