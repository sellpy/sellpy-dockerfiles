# Tag with node version
- Build the image with `docker build .` (add flag `--platform linux/amd64` if you're building on an Apple Silicon chip)
- List the images with `docker images` to find the newly build image (or take the id from `docker build` output)
- Create the tag `docker tag <IMAGE_ID> sellpy/circle-ci-base:node<NODE_VERSION>` like ":node10.16"
- Push the tag `docker push sellpy/circle-ci-base:node<NODE_VERSION>`
  - You need to be logged in with your personal user