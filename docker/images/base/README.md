# linux base image

```
chmod +x build.sh
./build.sh
```

The script will ask you to enter a tag name for the new image (by default: __latest__), after which you will be asked to enter a new password
  for the root user (the root that will be inside the container). After successful assembly, you will be prompted to send a new image
  to the docker repository (our private one), by default, the image is not sent.
