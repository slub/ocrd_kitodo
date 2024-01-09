#!/bin/bash

TASK=$(basename $0)
OCRD_MANAGER_HOST=${OCRD_MANAGER%:*}
OCRD_MANAGER_PORT=${OCRD_MANAGER#*:}

parse_args() {
  PROCESS_ID=
  TASK_ID=
  LANGUAGE=
  SCRIPT=
  WORKFLOW=
  while (($#)); do
    case "$1" in
      --help|-h) cat <<EOF
SYNOPSIS:

$0 [OPTIONS]

where OPTIONS can be any/all of:
 --proc-id ID       process ID (required)
 --task-id ID       task ID (required)
 --lang LANGUAGE    overall language of the material to process via OCR
 --script SCRIPT    overall script of the material to process via OCR
 --workflow FILE    workflow file to use for processing
 --help             show this message and exit
EOF
                 exit;;
      --lang) LANGUAGE="$2"; shift;;
      --script) SCRIPT="$2"; shift;;
      --workflow) WORKFLOW="$2"; shift;;
      --proc-id) PROCESS_ID="$2"; shift;;
      --task-id) TASK_ID="$2"; shift;;
    esac
    shift
  done
  if (($#>1)); then
    logger -p user.error -t $TASK "invalid extra arguments $*"
    exit 1
  fi
}

parse_args "$@"

if test -z "$PROCESS_ID"; then
  logger -p user.error -t $TASK "process ID not found"
  exit 2
fi

if test -z "$TASK_ID"; then
  logger -p user.error -t $TASK "task ID not found"
  exit 3
fi

COMMAND="process_images.sh --proc-id $PROCESS_ID --task-id $TASK_ID"

if test -n "$LANGUAGE"; then
    COMMAND+=" --lang $LANGUAGE"
fi

if test -n "$SCRIPT"; then
    COMMAND+=" --script $SCRIPT"
fi

if test -n "$WORKFLOW"; then
    COMMAND+=" --workflow /workflows/$WORKFLOW"
fi

if test -n "$MQ_HOST" -a -n "$MQ_PORT"; then
    COMMAND+=" --activemq-url tcp://$MQ_HOST:$MQ_PORT?closeAsync=false --activemq-queue TaskActionQueue --async true"
fi

COMMAND+=" /data/$PROCESS_ID"

logger -p user.notice -t $TASK "ssh destination 'ocrd@$OCRD_MANAGER_HOST' port '${OCRD_MANAGER_PORT:-22}' running command '$COMMAND'"

ssh -i /.ssh/id_rsa -Tn -p ${OCRD_MANAGER_PORT:-22} ocrd@$OCRD_MANAGER_HOST $COMMAND
