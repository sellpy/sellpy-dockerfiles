#!/bin/sh

[ -n $PORT ] && PORT=8888

jupyter notebook --ip=0.0.0.0 --port $PORT
