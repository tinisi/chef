
# get the current directory from enviroonment
current_dir = File.dirname(__FILE__)

# and the chef env
tinisi_env_str = ENV['CHEF_ENV'] || 'vbox'

# set up an environment map
puts 'environment: ' + tinisi_env_str
tinisi_env = tinisi_env_str.to_sym
tinisi_env_conf = Hash.new
tinisi_env_conf[:aws] = Hash.new
tinisi_env_conf[:vbox] = Hash.new

# some environment specific values
tinisi_env_conf[:aws][:chef_server_url] = 'https://chef-srv-v1-aws.tinisi.local/organizations/tinisihypermedia'
tinisi_env_conf[:vbox][:chef_server_url] = 'https://chef-server/organizations/tinisihypermedia'
tinisi_env_conf[:aws][:client_key] = "#{current_dir}/tinisi-aws.pem"
tinisi_env_conf[:vbox][:client_key] = "#{current_dir}/tinisi.pem"

# and simple/shared config
log_level                :info
log_location             STDOUT
node_name                "tinisi"
client_key               tinisi_env_conf[tinisi_env][:client_key]
# client_key               "#{current_dir}/tinisi.pem"
validation_key           "not/a/real/folder"
chef_server_url          tinisi_env_conf[tinisi_env][:chef_server_url]
# chef_server_url          "https://chef-server/organizations/tinisihypermedia"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
