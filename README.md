# Bug Bounty Docker Image Builder

This repository contains a Dockerfile and a script to build a customized Docker image for bug bounty hunting.

## Overview

The `Dockerfile` builds an image based on `callmedemon/bug_bounty_tools` and extracts several pre-packaged tools and templates. The `main.sh` script automates the process of building the image, running a container, committing the changes to a new image, and cleaning up intermediate containers and images.

## Files

-   `Dockerfile`: Defines the steps to build the Docker image.
-   `main.sh`: A shell script that automates the image building and cleanup process.
-   `README.md`: This file.

## Prerequisites

-   Docker installed and running.
-   The base image `callmedemon/bug_bounty_tools` must be available.
-   The following tarballs must be present in the same directory as the `Dockerfile`:
    -   `Templates.tar.gz`
    -   `magicrecon_env.tar.gz`
    -   `go.tar.gz`
    -   `tools.tar.gz`
    -   `git_cloned.tar.gz`
    -   `nuclei-templates.tar.gz`

## Usage

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/Lw1nM1n4ung/master_recon
    cd master_recon    ```

2.  **Place the required tarballs in the same directory as the `Dockerfile`.**

3.  **Run the `main.sh` script:**

    ```bash
    chmod +x main.sh
    ./main.sh
    ```

    This script will:

    -   Build a Docker image named `bounty_pre`.
    -   Run a container named `con` from the built image.
    -   Commit the changes from the container to a new image named `bug_bounty_ready`.
    -   Remove the intermediate `bounty_pre` image and container.
    -   Remove any dangling docker images.

4.  **Use the `bug_bounty_ready` Docker image:**

    You can now use the `bug_bounty_ready` Docker image for your bug bounty activities.

    ```bash
    docker run -it bug_bounty_ready /bin/bash
    ```

## Dockerfile Details

The `Dockerfile` performs the following actions:

-   Uses `callmedemon/bug_bounty_tools` as the base image.
-   Sets the working directory to `/root`.
-   Sets the `DEBIAN_FRONTEND` environment variable to `noninteractive`.
-   Extracts the provided tarballs and removes them after extraction.

## main.sh Details

The `main.sh` script automates the Docker image building and cleanup process. It uses the following Docker commands:

-   `docker build`: Builds a Docker image.
-   `docker run`: Runs a Docker container.
-   `docker commit`: Commits changes from a container to a new image.
-   `docker rmi`: Removes Docker images.
-   `docker ps`: Lists Docker containers.
-   `docker rm`: Removes Docker containers.

## Important Notes

-   Ensure that the tarballs contain the necessary tools and templates for your bug bounty activities.
-   The `main.sh` script removes intermediate containers and images. If you need to debug the intermediate container, comment out the cleanup commands.
-   Adjust the `Dockerfile` and `main.sh` script according to your specific requirements.
-   The `--progress=plain` option is used with docker build for better output visibility.

## Example

To use the created image, run:

```bash
docker run -it bug_bounty_ready /bin/bash
