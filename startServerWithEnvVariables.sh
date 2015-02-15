#!/bin/bash
if [ "$#" -ne 3 ]; then
    echo "Not enough number of parameters"
    echo "Usage: $0 SENDGRID_USERNAME SENDGRID_PASSWORD NEWRELIC_LICENSE"
    exit
fi
rails_env="production"
if [ "$rails_env" == "production" ]; then
    # TODO fixme append properly
    $rails_env="$rails_env SECRET_KEY_BASE=a6c1d8b3776c609f31b6c1a7a5f03bda05f27707b05efd26abd919d4b8b48496e2801287e021c7aed12a242b5b06cb0aaa4c380cec5e50272efa5fafc7bcee11"
fi
RAILS_ENV=$rails_env bundle install
RAILS_ENV=$rails_env rake db:migrate
SENDGRID_USERNAME=$1 SENDGRID_PASSWORD=$2 NEWRELIC_LICENSE=$3 RAILS_ENV=$rails_env SECRET_KEY_BASE=a6c1d8b3776c609f31b6c1a7a5f03bda05f27707b05efd26abd919d4b8b48496e2801287e021c7aed12a242b5b06cb0aaa4c380cec5e50272efa5fafc7bcee11 rails s
