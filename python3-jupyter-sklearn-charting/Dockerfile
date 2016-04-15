FROM lefant/python3-jupyter-sklearn:latest

ADD requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

EXPOSE 8888
ENTRYPOINT ["/tini", "--"]
CMD ["jupyter", "notebook", "--ip=0.0.0.0"]
