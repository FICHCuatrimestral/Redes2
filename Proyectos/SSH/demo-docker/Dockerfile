FROM python:3.11-slim

RUN apt-get update && apt-get install -y openssh-client postgresql-client

WORKDIR /app
COPY backup.sh .
COPY .ssh/id_ed25519 /root/.ssh/id_ed25519

RUN chmod 600 /root/.ssh/id_ed25519

CMD ["bash", "backup.sh"]