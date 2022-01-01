#!/bin/bash
/tmp/getConjurToken
main() {
  for i in {1..100}
do
  CONT_SESSION_TOKEN=$(cat /tmp/conjur_token| base64 | tr -d '\r\n')
  VAR_VALUE=$(curl -s -k -H "Content-Type: application/json" -H "Authorization: Token token=\"$CONT_SESSION_TOKEN\"" https://rhel81.alpha.local/secrets/myorg/variable/newApps%2FdbPassword-a)
  echo "The retrieved value is: $VAR_VALUE"
  sleep 1
done
}
main "$@"
exit
