#!/bin/bash

set -e

CONTAINER_NAME="flask-monitoring-container"

echo "Starting application deployment..."

echo "Building and starting Docker containers..."
docker compose up -d --build

echo "Waiting for application health check..."

for attempt in {1..10}
do
    HEALTH_STATUS=$(docker inspect --format='{{.State.Health.Status}}' "$CONTAINER_NAME")

    echo "Health status: $HEALTH_STATUS"

    if [ "$HEALTH_STATUS" = "healthy" ]; then
        echo "Application is healthy!"
        docker compose ps
        echo "Deployment completed successfully!"
        exit 0
    fi

    if [ "$HEALTH_STATUS" = "unhealthy" ]; then
        echo "Deployment failed: container is unhealthy."
        docker compose logs
        exit 1
    fi

    sleep 3
done

echo "Deployment failed: health check timed out."
docker compose logs
exit 1
