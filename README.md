# Custom Cloud Workstation Image for Rust Development

This is an example of how to create a custom Cloud Workstation image by extending a preconfigured base image, as detailed in the [official documentation](https://cloud.google.com/workstations/docs/customize-container-images).

The repository is configured to build and push a new Docker image to Artifact Registry on every push to the `main` branch. Then the image can be used to create a new Configuration in Cloud Workstations (or update an existing Configuration).

## Usage

Build locally with:

```sh
docker build . -t code-oss-for-rust
```

Test locally with:

```sh
docker run --privileged -p 8080:80 code-oss-for-rust
docker ps -q | xargs docker stop
```

Push to Artifact Registry with:

```sh
REGION=...
PROJECT_ID=...
AR_REPO_NAME=...
docker tag code-oss-for-rust \
  ${REGION}-docker.pkg.dev/${PROJECT_ID}/${AR_REPO_NAME}/code-oss-for-rust
docker push \
  ${REGION}-docker.pkg.dev/${PROJECT_ID}/${AR_REPO_NAME}/code-oss-for-rust
```

Or use Cloud Build to build, tag and push in a single step with:

```sh
REGION=...
PROJECT_ID=...
AR_REPO_NAME=...
gcloud builds submit \
  --tag ${REGION}-docker.pkg.dev/${PROJECT_ID}/${AR_REPO_NAME}/code-oss-for-rust
```

## References

- [Customize container images | Cloud Workstations | Google Cloud](https://cloud.google.com/workstations/docs/customize-container-images)
- [Cloud Build - GitHub Actions](https://github.com/google-github-actions/setup-gcloud/blob/main/example-workflows/cloud-build/README.md) for how to use Cloud Build from GitHub.
- [Deploy GCP Resources with Terraform from GitHub with Keyless Authentication](https://github.com/lvaylet/terraform-in-action) for how to authenticate from GitHub without a Service Account JSON key.
