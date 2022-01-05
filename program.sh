#!/bin/bash
GREEN="\033[32m"
NC='\033[0m' # No Color
#/tmp/getConjurToken

ConjurURL=https://rhel81.alpha.local
ConjurAccount=myorg
ConjurAPI=32q5ehz3qjbhbs1qkj7v83rhkksk322d7ar2bwammm18rwcmx2ctjxm3
ConjurHostID=host%2FnewApps%2Fjenkins-a
ConjurAccessToken=$(curl -s -d $ConjurAPI -k $ConjurURL/authn/myorg/$ConjurHostID/authenticate)
ConjurSecretVariable=newApps%2FdbPassword-a

echo "$ConjurAccessToken" > /tmp/conjur_token

main() {
  for i in {1..200}
do
  CONT_SESSION_TOKEN=$(cat /tmp/conjur_token| base64 | tr -d '\r\n')
  VAR_VALUE=$(curl -s -k -H "Content-Type: application/json" -H "Authorization: Token token=\"$CONT_SESSION_TOKEN\"" $ConjurURL/secrets/$ConjurAccount/variable/$ConjurSecretVariable)
  printf "Shhh! Please keep this secret ${GREEN}$VAR_VALUE${NC} to yourself\n"
  sleep 1
done
}
main "$@"
exit
