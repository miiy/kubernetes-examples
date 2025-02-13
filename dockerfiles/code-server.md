# code-server

```bash
#!/bin/sh
# This will start a code-server container and expose it at http://127.0.0.1:8080.
# It will also mount your current directory into the container as `/home/coder/project`
# and forward your UID/GID so that all file system operations occur as your user outside
# the container.
#
# Your $HOME/.config is mounted at $HOME/.config within the container to ensure you can
# easily access/modify your code-server config in $HOME/.config/code-server/config.json
# outside the container.
docker run -it --name code-server -d --restart=always \
  -v "/home/www/code-server.test/.config:/home/coder/.config" \
  -v "/home/www/code-server.test/project:/home/coder/project" \
  -v "/home/www/code-server.test/data:/home/coder/data" \
  -v "/home/www/code-server.test/.bash_aliases:/home/coder/.bash_aliases" \
  --net frontend \
  codercom/code-server:4.20.0
```