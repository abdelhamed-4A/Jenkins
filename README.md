# 🚀 Jenkins CI/CD Pipeline with Docker & Kubernetes

This project demonstrates a **CI/CD pipeline** using **Jenkins**, **Docker**, and **Kubernetes** to automate building, pushing, and deploying a web application.

## 📌 Features

- **Automated Builds**: Jenkins pulls the latest code from GitHub.
- **Dockerization**: The application is containerized using Docker.
- **Image Push**: Built images are pushed to Docker Hub.
- **Deployment**: Containers are deployed using Kubernetes.

## 📁 Project Structure

```
├── Jenkinsfile       # CI/CD pipeline definition
├── Dockerfile        # Instructions to build the Docker image
├── index.html        # Web application (sample page)
├── deployment.yaml   # Kubernetes deployment file
└── README.md         # Project documentation
```

## 🔧 Setup Instructions

### 1️⃣ Install Dependencies

Ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Jenkins](https://www.jenkins.io/download/)
- [Kubernetes (Minikube)](https://minikube.sigs.k8s.io/docs/start/)

### 2️⃣ Configure Jenkins

- Install required plugins: **Pipeline**, **Docker Pipeline**, **Git**, etc.
- Set up credentials for **GitHub** and **DockerHub**.
- Create a new **Pipeline Job** and link it to the `Jenkinsfile`.

### 3️⃣ Run the Pipeline

- Trigger a build in Jenkins.
- Docker builds and pushes the image.
- Kubernetes deploys the container.

## 🛠 Troubleshooting

- **Docker permission issue?** Run: `sudo usermod -aG docker $USER`
- **404 Error on Nginx?** Ensure `index.html` is correctly placed in `/usr/share/nginx/html/`




