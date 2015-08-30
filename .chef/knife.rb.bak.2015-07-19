current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "tinisi"
client_key               "#{current_dir}/tinisi.pem"
validation_key           "not/a/real/folder"
chef_server_url          "https://chef-server/organizations/tinisihypermedia"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
