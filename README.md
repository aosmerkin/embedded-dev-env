## Build environment (docker image):
``` bash
./env.sh build
```

## Start environment
```bash
./env.sh start
```
## Stop environment
```bash
./env.sh stop
```

## Attach to the environment and execute a command
```bash
./env.sh exec command
```

By default `/workspace` directory in the container is mapped onto
`../embedded-workspace` on the host file system.
It can be modified by setting `WORKSPACE` environment variable.

There is a `developer` user created inside the image for better intergration
with tools like VSCode. 

When environment is built it will set user and group for `developer` user to be the same as for the user which executes build command.

When container starts user and group shall be set into the same values that were used during image building to avoid issues. Normally this is handled by `./env.sh` script.
