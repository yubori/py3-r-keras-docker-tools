# py3-r-keras-docker-tools
It is a tools to run keras_tensorflow-gpu with python3 or r through docker. The docker is based on official gpu-based-tensorflow docker. 

# Usage
## Setup
- run setup.sh
- add ~/.local/bin to your PATH
- add your user to docker group

## run your script
run your_r_script on GPU0
```
run.r -d 0 your_r_script
```

run your_py_script on GPU1
```
run.py -d 1 your_py_script
```

run your_r_script without GPU
```
run.r your_r_script
```
