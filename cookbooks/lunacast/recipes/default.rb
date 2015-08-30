#
# Cookbook Name:: lunacast
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

application 'lunacast' do
  path       '/srv/lunacast'
  owner      'centos'
  group      'centos'
  repository 'https://github.com/tinisi/lunacast_django.git'
  revision   'twitter-client-spike'
  migrate    false
  packages   ['git']

  django do
    settings  {
        secret_key:"$z9jg^%4=p8q6ypcn&mnpm2t#m%k5_19@y5!atx+aq!0_-6e8z",
        bar:"baz",
        allowed_hosts:"['*']"
    }
    packages          ['redis']
    requirements      'requirements.txt'
    local_settings_file 'django_lunacast/lunacast/settings/local_settings.py'
    settings_template 'settings.py.erb'
    debug             true
    collectstatic     'build_static --noinput'
    environment       
    # database do
    #   database 'packaginator'
    #   adapter  'postgresql_psycopg2'
    #   username 'packaginator'
    #   password 'awesome_password'
    # end
    # database_master_role 'packaginator_database_master'
  end
end