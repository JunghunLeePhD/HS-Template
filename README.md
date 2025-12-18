# Haskell Webapp Template

A production-ready **template** for building lightweight, high-performance web applications with **Haskell** and **Scotty**.

This project uses a **Split-Repository Architecture**:

- **Base Environment:** Uses a pre-built public Docker image (`haskell-dev-base`) for heavy tools.
- **App Code:** This repository contains only the source code.
- **CI/CD:** GitHub Actions automatically builds and publishes the production image to GHCR.

## 🚀 Features

- **Backend:** Haskell (GHC 9.4) + Scotty Framework.
- **Frontend:** Serves static HTML/CSS/JS with Prettier formatting.
- **Dev Environment:** VS Code Devcontainer (Instant startup).
- **Deployment:** Pulls pre-built Docker images from GitHub Container Registry.

---

## 🟢 How to Use This Template

### 1. Create Your Repository

Click the **"Use this template"** button at the top of this GitHub page.

### 2. Rename the Project

Search for `my-haskell-webapp` and `YOUR_GITHUB_USERNAME` in the following files and replace them with your actual details:

1.  `package.yaml` (Project name)
2.  `docker-compose.yml` (Prod Image URL)

---

## 💻 How to Run Locally

### A. Development Mode (For Coding)

_Requires [VS Code](https://code.visualstudio.com/) and [Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)._

1.  Open the folder in VS Code.
2.  Click **"Reopen in Container"** when prompted.
3.  Run the server:
    ```bash
    just run
    ```
    - Access at [http://localhost:3000](http://localhost:3000).

### B. Production Mode (Fastest)

Since this project uses GitHub Actions, you do not need to build the image locally. You can simply pull the latest pre-built image from GitHub.

**1. Update `docker-compose.yml`**
Ensure the `image:` field points to your GitHub repository (e.g., `ghcr.io/username/repo:latest`).

**2. Run the App**

```bash
docker compose pull
docker compose up -d
```

**3. Access the App**

- Open [http://localhost:3000](https://www.google.com/search?q=http://localhost:3000)

## **🛠️ Commands (`**just**`)**

Run these inside the Devcontainer:

| Command             | Description                                            |
| ------------------- | ------------------------------------------------------ |
| `just run`          | Compile and start the web server (Dev mode).           |
| `just watch`        | Recompiles and restarts on file save.                  |
| `just fmt`          | Format all `.hs`, `.js`, `.css`, and `.html` files.    |
| `just docker-build` | **Manual Build:** Build the prod image locally (slow). |
| `just docker-run`   | **Manual Run:** Run the locally built image.           |

## **📂 Project Structure**

```Plaintext
.
├── .devcontainer/           # VS Code Devcontainer configuration
│   └── devcontainer.json
├── .github/
│   └── workflows/
│       └── deploy.yml       # GitHub Actions CI/CD pipeline
├── app/
│   └── Main.hs              # Haskell source code (Entry point)
├── static/
│   └── index.html           # Static frontend assets (HTML, CSS, JS)
├── .dockerignore            # Files to exclude from Docker builds
├── .gitignore               # Files to ignore in Git
├── .prettierignore          # Files to exclude from Prettier formatting
├── .prettierrc              # Prettier formatting rules
├── Dockerfile               # Production image build definition
├── docker-compose.yml       # Production startup script (pulls from GHCR)
├── justfile                 # Task runner commands (just run, just build)
├── my-haskell-webapp.cabal  # Auto-generated Cabal file (do not edit manually)
├── package.yaml             # Project dependencies & metadata (Edit this one)
├── stack.yaml               # Stack tool configuration
└── stack.yaml.lock          # Locked dependency versions
```

## **📝 License**

[MIT](https://www.google.com/search?q=LICENSE)
