# 🚀 Go Docker App

A simple web application written in Go, containerized with Docker, and ready for CI/CD deployment with Jenkins!

---

## 📦 Features

- ✅ RESTful API with Go
- 🐳 Dockerized for easy deployment
- 🔁 Jenkins pipeline support (CI/CD)
- ☁️ Deploys directly to remote server via SSH
- 🔐 SSH Key-based secure deployment

---

## 🛠️ Tech Stack

- [Go](https://golang.org/)
- [Docker](https://www.docker.com/)
- [Jenkins](https://www.jenkins.io/)
- Linux-based remote server (Ubuntu / Rocky Linux / AlmaLinux)

---

## 🚧 Folder Structure
## 🚧 Folder Structure

go-docker-app/ ├── main.go # Main Go application ├── Dockerfile # Docker image configuration ├── Jenkinsfile # Jenkins pipeline script └── README.md # Project documentation
---

## 🚀 Getting Started

### 🔧 Requirements

- Docker installed
- Go installed
- Jenkins running
- SSH access to remote server

### ⚙️ Build & Run Docker Locally

```bash
docker build -t go-docker-app .
docker run -p 8080:8080 go-docker-app
🤖 Jenkins CI/CD Pipeline
Jenkinsfile includes the following steps:

🧾 Checkout code from GitHub

🐳 Build Docker image

💾 Save and transfer image to remote server

🚀 Deploy Docker container on remote server

💡 Jenkins Setup Tips
Use "Pipeline from SCM" in Jenkins

Add SSH Credentials via Jenkins > Credentials

Optionally trigger builds automatically on git push

📡 Deployment
Once Jenkins pipeline completes, your app will be deployed and accessible at:

http://<your-server-ip>:80
Make sure port 80 is open on your server.

✍️ Author
Andika Ferdialvianto
📫 github.com/andikaferdialvianto

📃 License
This project is licensed under the MIT License.
See the LICENSE file for details.
