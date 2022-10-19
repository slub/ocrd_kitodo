#!/bin/bash

TASK=$(basename $0)
PROCESS_ID=$1
TASK_ID=$2
OCRD_MANAGER_HOST=${OCRD_MANAGER%:*}
OCRD_MANAGER_PORT=${OCRD_MANAGER#*:}

if test -z "$PROCESS_ID"; then
  logger -p user.error -t $TASK "process ID not found"
  exit 2
fi

if test -z "$TASK_ID"; then
  logger -p user.error -t $TASK "task ID not found"
  exit 3
fi

COMMAND="for_production.sh --proc-id $PROCESS_ID --task-id $TASK_ID --lang deu --script Fraktur"
WORKFLOW_FILE="ocr-workflow.sh"
if test -f "/usr/local/kitodo/metadata/$PROCESS_ID/$WORKFLOW_FILE"; then
    COMMAND+=" --workflow /data/$PROCESS_ID/$WORKFLOW_FILE"
fi
COMMAND+=" /data/$PROCESS_ID"

logger -p user.notice -t $TASK "ssh destination 'ocrd@$OCRD_MANAGER_HOST' port '${OCRD_MANAGER_PORT:-22}' running command '$COMMAND'"

ssh -i /.ssh/id_rsa -Tn -p ${OCRD_MANAGER_PORT:-22} ocrd@$OCRD_MANAGER_HOST $COMMAND
