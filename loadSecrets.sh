#!/bin/bash

conjur variable set -i newApps/dbUser-a -v admin
conjur variable set -i newApps/dbUser-b -v admin
conjur variable set -i newApps/dbPassword-a -v $(openssl rand -base64 12)
conjur variable set -i newApps/dbPassword-b -v $(openssl rand -base64 12)
