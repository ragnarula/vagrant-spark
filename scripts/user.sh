#!/usr/bin/env bash

install -d ~/.jupyter

cat > /home/ubuntu/.jupyter/jupyter_notebook_config.py << END
c.NotebookApp.token = ''
c.NotebookApp.password = ''
c.NotebookApp.ip = '*'
c.NotebookApp.allow_origin = '*'
END
