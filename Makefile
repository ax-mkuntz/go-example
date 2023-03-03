build:
	docker buildx build \
      --push=false \
	  --platform linux/amd64 \
      -t ax-mkuntz:go-example \
	  --secret id=ARTIFACTORY_USER \
	  --secret id=ARTIFACTORY_PASSWORD \
	  --build-arg ARTIFACTORY_URL="$$ARTIFACTORY_URL" \
	  --progress=plain \
	  -f Dockerfile .
