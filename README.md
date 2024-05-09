# Custom Cloud Workstation Image for Rust Development

This is an example of how to create a custom Cloud Workstation image by extending a preconfigured base image, as detailed in the [official documentation](https://cloud.google.com/workstations/docs/customize-container-images).

TODO: The repository is configured to build and push a new Docker image to Artifact Registry on every push to the `main` branch. Then the image can be used to create a new Configuration in Cloud Workstations (or update an existing Configuration).

## References

- [Cloud Build - GitHub Actions](https://github.com/google-github-actions/setup-gcloud/blob/main/example-workflows/cloud-build/README.md) for how to use Cloud Build from GitHub.
- [Deploy GCP Resources with Terraform from GitHub with Keyless Authentication](https://github.com/lvaylet/terraform-in-action) for how to authenticate from GitHub without a Service Account JSON key.
