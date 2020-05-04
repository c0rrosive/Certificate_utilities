#/bin/bash
#Collects and stores endpoint certifcates TLS from endpoints returned by DNS query. Tested on MacOS and Linux.
if [[ -z $1 || -z $2  ]]; then
  echo 'IP address and port must be specified ex: ./cert_scraper_dns.sh <IP_address> <Port_number>'
  exit 1
fi
for i in `host -t A $1 | awk '{print $4}'`; do echo | openssl s_client -connect $i:$2 2> /dev/null | openssl x509 >$i.crt; done;
