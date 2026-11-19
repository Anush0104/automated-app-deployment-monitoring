# Automated Application Deployment & Monitoring System

A containerized Flask application demonstrating automated testing,
Docker-based deployment, application health monitoring, and
CI automation using GitHub Actions.

## Features

- Flask REST API with application and health endpoints
- Automated testing using Pytest
- Production server using Gunicorn
- Docker containerization
- Docker Compose deployment
- Container health checks
- Bash scripts for deployment and shutdown
- GitHub Actions CI pipeline for automated testing and Docker builds

## Tech Stack

- Python 3.12
- Flask
- Gunicorn
- Pytest
- Docker
- Docker Compose
- Linux (Ubuntu / WSL2)
- Bash
- Git and GitHub
- GitHub Actions

## Project Structure

automated-app-deployment-monitoring/
├── .github/workflows/ci-cd.yml
├── scripts/
│   ├── deploy.sh
│   └── stop.sh
├── app.py
├── test_app.py
├── requirements.txt
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
└── .gitignore

## API Endpoints

| Endpoint | Description |
|----------|-------------|
| `/` | Application status and timestamp |
| `/health` | Health check endpoint |

## Run Locally

```bash
git clone https://github.com/Anush0104/automated-app-deployment-monitoring.git
cd automated-app-deployment-monitoring

python3 -m venv venv
source venv/bin/activate

pip install -r requirements.txt
python app.py
