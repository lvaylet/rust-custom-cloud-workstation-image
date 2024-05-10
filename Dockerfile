FROM us-central1-docker.pkg.dev/cloud-workstations-images/predefined/code-oss@sha256:39d29f060459a806632e795fa3f2be2b39e69b3309912ab99de7cccadbc8f7ad
# Usage:
#   Build locally with:
#     docker build . -t code-oss-for-rust
#   Test locally with:
#     docker run --privileged -p 8080:80 code-oss-for-rust
#     docker ps -q | xargs docker stop
#   Push to Artifact Registry with:
#     docker tag code-oss-for-rust europe-west9-docker.pkg.dev/my-cloud-workstations-417118/docker/code-oss-for-rust
#     docker push europe-west9-docker.pkg.dev/my-cloud-workstations-417118/docker/code-oss-for-rust
#   Or use Cloud Build to build/tag/push automatically with:
#     gcloud builds submit --tag europe-west9-docker.pkg.dev/my-cloud-workstations-417118/docker/code-oss-for-rust
#
# References:
# - https://cloud.google.com/workstations/docs/customize-container-images

# Add static assets, for example packages.
#
# References:
# - https://techoverflow.net/2021/01/13/how-to-use-apt-install-correctly-in-your-dockerfile/
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
  make build-essential lld clang \
  musl-tools \
  libssl-dev \
  pkg-config \
  postgresql-client \
  wget curl \
  vim nano \
  locales \
  && rm -rf /var/lib/apt/lists/*

# Configure locale to eliminate warnings on `sudo apt install`, `pyenv` and probably a lot more.
RUN echo "en_US.UTF-8 UTF-8" | tee /etc/locale.gen
RUN locale-gen
