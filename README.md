CICD Badge: [![Build and Push Docker Image](https://github.com/nzarama-kouadio/redo12/actions/workflows/cicd.yml/badge.svg)](https://github.com/nzarama-kouadio/redo12/actions/workflows/cicd.yml)


# Hangman Game - Dockerized Flask Application

## Overview
This project is a Dockerized Hangman game implemented using Flask. It features a simple and interactive web interface for users to guess letters and solve words. The application is containerized for seamless deployment and includes a CI/CD pipeline for automated Docker image building and pushing.


## Features
- Flask-based Hangman game with an intuitive UI.
- Fully Dockerized for portability and ease of deployment.
- Automated CI/CD pipeline using GitHub Actions.
- Easy to run locally or deploy to a container hosting platform.


## Requirements
To run this project, make sure you have the following installed:
- **Python 3.8+**
- **Docker**
- **GitHub CLI** (optional, for managing GitHub Actions)

## Getting Started

### Clone the Repository
```bash
git clone https://github.com/nzarama-kouadio/redo12.git
cd redo12
```
### Run Locally with Docker

1. **Build the Docker image**:
   ```bash
   docker build -t hangman-app .
   ```

2. **Run the Docker container**:
   ```bash
   docker run -p 5000:5000 hangman-app
   ```

3. Open your browser and navigate to [http://localhost:5000](http://localhost:5000).


## CI/CD Pipeline

This project includes a GitHub Actions workflow for CI/CD to automate building and pushing the Docker image to Docker Hub.

### Workflow Steps:
1. **Trigger**: Runs on push to the `main` branch.
2. **Steps**:
   - Check out the repository code.
   - Log in to Docker Hub using GitHub Secrets.
   - Build the Docker image.
   - Push the Docker image to Docker Hub.

## Setting Up CI/CD

1. Go to your GitHub repository **Settings > Secrets and variables > Actions**.
2. Add the following secrets:
   - **`DOCKER_USERNAME`**: Your Docker Hub username.
   - **`DOCKER_PASSWORD`**: Your Docker Hub access token.
3. Push changes to the `main` branch to trigger the workflow.

## Makefile Commands

The `Makefile` contains the following commands to simplify Docker operations:

- **Build the Docker image**:
  ```bash
  make build
  ```
- **Run the container locally**:
  ```bash
  make run
  ```
- **Stop and clean up containers and images**:
  ```bash
  make clean
  ```
- **Push the Docker image to Docker Hub**:
  ```bash
  make push
  ```
- **View all Docker images**:
  ```bash
  make image_show
  ```
- **View all running containers**:
  ```bash
  make container_show
  ```

## Docker Hub Repository

The Docker image for this application is available on Docker Hub:
- [Docker Hub Repository](https://hub.docker.com/r/<your-docker-username>/<image-name>)

