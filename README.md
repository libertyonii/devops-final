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
# DevOps Final Assessment
![CI](https://github.com/libertyonii/devops-final/actions/workflows/ci.yml/badge.svg)

### 4. CI/CD with GitHub Actions
A GitHub Actions workflow (`.github/workflows/ci.yml`) runs `hello.py`
automatically on every push and pull request to `main`. The status badge
above reflects the current pipeline state.

### 5. Job Deployment with Nomad
A Nomad job file (`nomad/hello.nomad`) deploys the `devops-final-hello:v1`
Docker image as a `service` type job with minimal resources (100 MHz CPU,
64MB memory).

Note: the image is tagged `v1` rather than `latest` — Nomad's Docker
driver always attempts a registry pull for the `latest` tag, which fails
for local-only images. Using a specific version tag lets Nomad use the
locally built image directly.

Start a local Nomad dev agent and run the job with:
\`\`\`bash
nomad agent -dev
nomad job run nomad/hello.nomad
nomad job status hello
nomad alloc logs <ALLOCATION_ID>
\`\`\`

Expected log output:
\`\`\`
Hello, DevOps!
\`\`\`

Since `hello.py` exits immediately after printing, Nomad
(configured with `type = "service"`) marks the deployment "unhealthy"
after the process exits — this is expected for a one-shot script under a
service-type job, but the container itself runs and prints correctly, as
shown above.