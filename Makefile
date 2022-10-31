.PHONY: default
default:
	# TODO: split into multiple recipes.
	docker build -t emivespa/test-app-frontend:$$(git rev-parse --short HEAD) .
	docker tag emivespa/test-app-frontend:$$(git rev-parse --short HEAD) emivespa/test-app-frontend:latest
	docker tag emivespa/test-app-frontend:$$(git rev-parse --short HEAD) emivespa/test-app-frontend:stable
	docker push emivespa/test-app-frontend:$$(git rev-parse --short HEAD)
	docker push emivespa/test-app-frontend:latest
	docker push emivespa/test-app-frontend:stable
