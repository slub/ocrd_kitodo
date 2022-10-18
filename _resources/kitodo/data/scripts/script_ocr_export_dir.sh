#!/bin/bash

TASK=$(basename $0)
PROCESS_TITLE=$1
TASK_ID=$2

if test -z "$PROCESS_TITLE"; then
  logger -p user.error -t $TASK "process title not found"
  exit 1
fi

if test -z "$TASK_ID"; then
  logger -p user.error -t $TASK "task ID not found"
  exit 2
fi

logger -p user.error -t $TASK "Process title $PROCESS_TITLE and task id $TASK_ID are available."
