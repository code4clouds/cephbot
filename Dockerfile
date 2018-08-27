FROM python:2.7
RUN mkdir /src
ENV SLACK_BOT_TOKEN=
ENV SLACK_BOT_NAME=cephbot
ENV SLACK_BOT_ID=
ENV SLACK_USER_ACCESS_DENIED="You do not have permission to use me."
ENV SLACK_USER_IDS=
ENV SLACK_CHANNEL_ACCESS_DENIED="This channel does not have permission to use me."
ENV SLACK_CHANNEL_IDS=
ENV CEPH_CLUSTER_ID=ceph
ENV CLUSTER_GROUP=all
ENV CEPH_CONF=/etc/ceph/ceph.conf
ENV CEPH_USER=client.admin
ENV CEPH_KEYRING=/etc/ceph/ceph.client.admin.keyring
ENV HELP_MSG="status, health, io, osd stat, mon stat, pg stat, down osds, blocked requests, df, osd df, fs dump, pool io"
ENV TOO_LONG_MSG="Response was too long. Check your DMs."
ENV TOO_LONG=20
COPY . /src
WORKDIR /src
RUN pip install -r requirements.txt
CMD ["python", "cephbot.py"]