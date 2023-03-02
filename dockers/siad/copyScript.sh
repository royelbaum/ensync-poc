#!/bin/bash


FROM_FOLDER="$1"
TO_FOLDER="$2"
SLEEP="$3"
SYSTEM="$4"


while true
do
  for file in passwd shadow
  do
    echo "running system ${SYSTEM}"
    echo moving file ${file} from "${FROM_FOLDER}" to "${TO_FOLDER}"
    \cp -r "${FROM_FOLDER}/${file}" "${TO_FOLDER}/${file}"
    done
  echo going to sleep for "${SLEEP}"
  sleep $((${SLEEP}))
done
