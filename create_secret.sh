#!/bin/bash

if [ ! -z "$1" ]; then
  cat <<EOF | kubectl apply -f -
  apiVersion: v1
  kind: Secret
  metadata:
    name: pihole-secret
  type: Opaque
  data:
    password: $(echo -n $1 | base64 -w0)
EOF

else 
  echo "Password missing..."
fi
