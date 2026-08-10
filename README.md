### 2. Linux & Scripting Basics
A `scripts/sysinfo.sh` script prints the current user, current date, and
disk usage.

Make it executable and run it with:
\`\`\`bash
chmod +x scripts/sysinfo.sh
./scripts/sysinfo.sh
\`\`\`

### 3. Docker Basics
A `Dockerfile` containerizes `hello.py`. It uses a slim Python 3.13 base
image, copies `hello.py` into the container, and runs it on startup.

Build and run the container with:
\`\`\`bash
docker build -t devops-final-hello .
docker run devops-final-hello
\`\`\`

Expected output:
\`\`\`
Hello, DevOps!
\`\`\`

### 4. CI/CD with GitHub Actions
A GitHub Actions workflow (`.github/workflows/ci.yml`) runs `hello.py`
automatically on every push and pull request to `main`. The status badge
above reflects the current pipeline state.