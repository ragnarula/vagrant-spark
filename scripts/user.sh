#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

cat >> /home/ubuntu/.bashrc << END
# add for anaconda install
PATH=/opt/anaconda/bin:\$PATH
PATH=/opt/spark/bin:\$PATH
export PYSPARK_DRIVER_PYTHON="jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser"
END

install -d ~/.jupyter
/opt/anaconda/bin/jupyter notebook --generate-config

cat >> /home/ubuntu/.jupyter/jupyter_notebook_config.py << END
c.NotebookApp.token = ''
c.NotebookApp.password = ''
c.NotebookApp.ip = '*'
c.NotebookApp.allow_origin = '*'
END
