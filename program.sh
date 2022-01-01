#!/bin/bash
GREEN="\033[32m"
NC='\033[0m' # No Color
/tmp/getConjurToken
main() {
  for i in {1..100}
do
  CONT_SESSION_TOKEN=$(cat /tmp/conjur_token| base64 | tr -d '\r\n')
  VAR_VALUE=$(curl -s -k -H "Content-Type: application/json" -H "Authorization: Token token=\"$CONT_SESSION_TOKEN\"" https://rhel81.alpha.local/secrets/myorg/variable/newApps%2FdbPassword-a)
  printf "Shhh! Please keep this secret ${GREEN}$VAR_VALUE${NC} to yourself\n"
  #echo -e "Shhh! Please keep this secret" $GREEN $VAR_VALUE "to yourself"  
  sleep 1
done
}
main "$@"
exit
