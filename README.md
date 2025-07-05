# Go Docker Application

A simple Go web application with Docker CI/CD pipeline.

## CI/CD Pipeline Setup

The CI/CD pipeline is configured to automatically build and push Docker images to Docker Hub. It includes the following steps:

1. Docker Login
2. Docker Build
3. Docker Tag
4. Docker Push
5. Docker Run (for testing)

### Required Secrets

To use this pipeline, you need to set up the following secrets in your GitHub repository:

- `DOCKER_HUB_USERNAME`: Your Docker Hub username
- `DOCKER_HUB_TOKEN`: Your Docker Hub access token (not your password)

### How to Set Up Docker Hub Token

1. Log in to [Docker Hub](https://hub.docker.com)
2. Go to Account Settings -> Security
3. Create a new access token
4. Copy the token and add it as a secret in your GitHub repository

### Local Development

To run the application locally:

```bash
# Build the Docker image
docker build -t go-docker-app .

# Run the container
docker run -p 8080:8080 go-docker-app
```

The application will be available at `http://localhost:8080`

## Application Structure

- `app.go` - Main application code
- `Dockerfile` - Multi-stage Docker build configuration
- `.github/workflows/docker-ci.yml` - CI/CD pipeline configuration