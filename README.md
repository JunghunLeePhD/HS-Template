# Haskell Webapp Template

A production-ready **template** for building lightweight, high-performance web applications with **Haskell** and **Scotty**.

Use this repository as a starting point for your new Haskell projects. It features a **Split-Repository Architecture** to ensure instant development environments:

- **Base Environment:** Uses a pre-built public Docker image (`hs-template-env`) for heavy tools.
- **App Code:** Keeps this repository light and fast.

## 🚀 Features

- **Backend:** Haskell (GHC 9.4) + Scotty Framework.
- **Architecture:** configured for JSON APIs & HTML rendering.
- **Dev Environment:** VS Code Devcontainer (Instant startup).
- **Tooling:** Pre-configured with `just`, `ormolu` (formatter), and `zsh`.
- **Deployment:** Production-ready Multi-stage Dockerfile.

---

## 🟢 How to Use This Template

### 1. Create Your Repository

Click the **"Use this template"** button at the top of this GitHub page to create a new repository with this starter code.

### 2. Rename the Project

Once you have cloned your new repository, you need to update the project name in a few files.
Search for `my-haskell-webapp` and `YOUR_GITHUB_USERNAME` in the following files and replace them with your own details:

1.  `package.yaml`: Change `name:` and `github:`.
2.  `.devcontainer/devcontainer.json`: Update the `image` URL to point to your base image (if you are maintaining your own base).
3.  `docker-compose.yml`: Update container names.
4.  `justfile`: Update the executable name in the `watch` command.

---

## 🛠️ For Developers

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [VS Code](https://code.visualstudio.com/)
- [Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### Getting Started

1.  **Clone your new repository:**

    ```bash
    git clone [https://github.com/YOUR_USERNAME/YOUR-NEW-PROJECT.git](https://github.com/YOUR_USERNAME/YOUR-NEW-PROJECT.git)
    cd YOUR-NEW-PROJECT
    ```

2.  **Open in VS Code:**

    ```bash
    code .
    ```

3.  **Start the Environment:**
    - You will see a popup: _"Folder contains a Dev Container configuration..."_
    - Click **Reopen in Container**.
    - _VS Code will pull the base image and set up your workspace automatically._

### Development Commands

We use `just` to manage project tasks. Open the integrated terminal (`Ctrl+~`) and run:

| Command             | Description                                                          |
| :------------------ | :------------------------------------------------------------------- |
| `just run`          | **Start Server:** Runs the app at `http://localhost:3000`.           |
| `just watch`        | **Dev Mode:** Automatically restarts the server when you save files. |
| `just build`        | **Compile:** Builds the project executable.                          |
| `just fmt`          | **Format:** Formats all `.hs` files using Ormolu.                    |
| `just docker-build` | **Test Prod:** Builds the production Docker image locally.           |
| `just docker-run`   | **Run Prod:** Runs the production image locally.                     |

---

## 📦 For Users (Deployment)

You do not need to install Haskell to run this application. You only need Docker.

### Option 1: Docker Compose (Recommended)

Run the application in the background with a single command:

```bash
docker compose up -d
```

- **Access:** Open [http://localhost:3000](http://localhost:3000)
- **Logs:** `docker compose logs -f`
- **Stop:** `docker compose down`

### **Option 2: Manual Run**

If you prefer standard Docker commands:

```bash
docker build -t my-app .

docker run --rm -p 3000:3000 --name my-app-container my-app
```

## **📂 Project Structure**

```Plaintext
.
├── .devcontainer/       # Configures VS Code to use the public base image
├── app/                 # Source code (Main.hs)
├── docker-compose.yml   # Simplified startup for end-users
├── Dockerfile           # Production build (Multi-stage: Builder -> Runner)
├── justfile             # Task runner configuration
├── package.yaml         # Project dependencies (Hpack)
└── stack.yaml           # Stack tool configuration
```

## **📝 License**

[MIT](https://www.google.com/search?q=LICENSE)
