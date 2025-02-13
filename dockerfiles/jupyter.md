# jupyter

```bash
docker run -it --name jupyter-lab -d --restart=always \
  -v "/data/www/jupyter.test/work:/home/jovyan/work" \
  --net frontend \
  jupyter/scipy-notebook:lab-4.0.7
```