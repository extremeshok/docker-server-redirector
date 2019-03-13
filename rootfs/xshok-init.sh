#!/bin/bash

if [ -z "$TARGET" ] ; then
  echo "ERROR: env varibles not configured"
  exit 1
fi

echo "#### Generating HAPROXY config "

portlist="25,465,587,110,995,143,993,119,563,53,80,8080,443,8443,1080,3128,873,3306,5432,4333,5800,2082,2083,10000,20000"
IFS=","
for port in $portlist ; do
  # remove leading whitespace characters
  port="${port#"${port%%[![:space:]]*}"}"
  # remove trailing whitespace characters
  port="${port%"${port##*[![:space:]]}"}"
  cat << EOF >> /etc/haproxy/haproxy.cfg
# Port ${port}
frontend frnt_${port}
  mode tcp
  bind *:${port}
  default_backend bk_${port}

backend bk_${port}
  mode tcp
  server server_${port} ${TARGET}:${port}

EOF

done



exit 0
