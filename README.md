# analytics

Analytics platform supporting the USSF portal

## Local Development

You may need to delcare these env vars in `.envrc.local` if you want to build and or push locally.

```shell
export ARTIFACTORY_TOKEN=''

export C1_REGISTRY=''
export C1_REPOSITORY=''
export IMAGE_TAG=$(git rev-parse HEAD)
```
