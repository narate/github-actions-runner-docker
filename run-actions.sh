#!/bin/bash
./config.sh --unattended \
    --url $URL \
    --token $TOKEN \
    --replace \
    --name $NAME \
    --labels $LABELS

./run.sh
