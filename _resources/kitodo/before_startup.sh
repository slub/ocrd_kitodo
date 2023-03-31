#!/bin/bash

SSH_PRIVATE_KEY=/id_rsa
if [ -f "$SSH_PRIVATE_KEY" ]; then
  cat $SSH_PRIVATE_KEY >>/.ssh/id_rsa
fi

# removes read/write/execute permissions from group and others, but preserves whatever permissions the owner had
chmod go-rwx /.ssh/*

# Add ocrd manager as global and known_hosts if env exist
if [ -n "$OCRD_MANAGER" ]; then
  OCRD_MANAGER_HOST=${OCRD_MANAGER%:*}
  OCRD_MANAGER_PORT=${OCRD_MANAGER#*:}

  echo "Wait for ocrd manager ssh."
  /wait-for-it.sh -t 0 ${OCRD_MANAGER_HOST}:${OCRD_MANAGER_PORT:-22}

  OCRD_MANAGER_IP=$(nslookup $OCRD_MANAGER_HOST | grep 'Address\:' | awk 'NR==2 {print $2}')

  if test -e /etc/ssh/ssh_known_hosts; then
    ssh-keygen -R $OCRD_MANAGER_HOST -f /etc/ssh/ssh_known_hosts
    ssh-keygen -R $OCRD_MANAGER_IP -f /etc/ssh/ssh_known_hosts
  fi

  ssh-keyscan -H -p ${OCRD_MANAGER_PORT:-22} $OCRD_MANAGER_HOST,$OCRD_MANAGER_IP >>/etc/ssh/ssh_known_hosts
fi
