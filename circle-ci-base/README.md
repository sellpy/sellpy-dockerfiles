# Tag with node version
- Build the image and list the new images with `docker images`
- Create the tag `docker tag <IMAGE_ID> sellpy/circle-ci-base:node<NODE_VERSION>` like ":node10.16"
- Push the tag `docker push sellpy/circle-ci-base:node<NODE_VERSION>`
  - You need to be logged in with your personal user