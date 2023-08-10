FROM splunk/splunk:9.0

USER root
CMD apt update && \
    #    apt install -y python3 && \
    #    apt install -y python3-pip && \
    apt install -y curl && \
    apt install -y zip && \
    apt install -y unzip && \
    apt clean

RUN pip install -r /tmp/requirements.txt && \
        rm -rf /var/lib/apt/lists/* && \
        rm -rf /tmp/requirements.txt

CMD cp -rf /usr/local/lib/python3.7/dist-packages /opt/splunk/lib/python3.7/site-packages/
USER ansible

ENTRYPOINT [ "/sbin/entrypoint.sh" ]

CMD [ "start-service" ]
