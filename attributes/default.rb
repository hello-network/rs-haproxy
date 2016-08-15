#
# Cookbook Name:: rs-haproxy
# Attribute:: default
#
# Copyright (C) 2014 RightScale, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# The pools served by the HAProxy load balancer
default['rs-haproxy']['pools'] = ['default']

# The port on which HAProxy listens for HTTP requests
default['rs-haproxy']['incoming_port'] = 80

# The port on which HAProxy listens for HTTPS requests
default['rs-haproxy']['ssl_incoming_port'] = 443

# SSL certificate to set up HTTPS support
default['rs-haproxy']['ssl_cert'] = nil

# URI for HAProxy statistics
default['rs-haproxy']['stats_uri'] = '/haproxy-status'

# Username to access HAProxy statistics
default['rs-haproxy']['stats_user'] = nil

# Password to access HAProxy statistics
default['rs-haproxy']['stats_password'] = nil

# Enable/Disable sticky sessions using cookie
default['rs-haproxy']['session_stickiness'] = true

# Enable/Disable periodically running rs-haproxy::frontend
default['rs-haproxy']['schedule']['enable'] = true

# Interval to periodically run rs-haproxy::frontend, in minutes
default['rs-haproxy']['schedule']['interval'] = '15'

# URI to check server health
default['rs-haproxy']['health_check_uri'] = '/'

# Algorithm used by load balancer to direct traffic
# Supported algorithms - "roundrobin", "leastconn", "source"
default['rs-haproxy']['balance_algorithm'] = 'roundrobin'

# HAProxy install method
# Supported values - 'package', 'source'
default['rs-haproxy']['install_method'] = 'source'

# HAProxy source version
# Set to nil to attempt retrieving version from rs-haproxy/source/url
default['rs-haproxy']['source']['version'] = nil

# HAProxy source URL
default['rs-haproxy']['source']['url'] = 'http://ps-cf.rightscale.com/haproxy/haproxy-1.5.18.tar.gz'

# HAProxy source SHA256 checksum
default['rs-haproxy']['source']['checksum'] = '21d35f114583ef731bc96af05b46c75a'

# HAProxy backend checks
default['rs-haproxy']['backend']['inter'] = 300
default['rs-haproxy']['backend']['rise'] = 3
default['rs-haproxy']['backend']['fall'] = 2

# HAProxy default maxconn
default['rs-haproxy']['global_max_connections'] = 4096

# New inputs

default['haproxy']['user'] = 'haproxy'
default['haproxy']['group'] = 'haproxy'

default['haproxy']['enable_default_http'] = true
default['haproxy']['incoming_address'] = '0.0.0.0'
default['haproxy']['incoming_port'] = 80

default['haproxy']['member_port'] = 8080
default['haproxy']['member_weight'] = 1
default['haproxy']['app_server_role'] = 'webserver'
default['haproxy']['balance_algorithm'] = 'roundrobin'
default['haproxy']['enable_ssl'] = false
default['haproxy']['ssl_incoming_address'] = '0.0.0.0'
default['haproxy']['ssl_incoming_port'] = 443
default['haproxy']['ssl_member_port'] = 8443
default['haproxy']['httpchk'] = nil
default['haproxy']['ssl_httpchk'] = nil
default['haproxy']['enable_admin'] = true
default['haproxy']['admin']['address_bind'] = '127.0.0.1'
default['haproxy']['admin']['port'] = 22_002
default['haproxy']['enable_stats_socket'] = false
default['haproxy']['stats_socket_path'] = '/var/run/haproxy.sock'
default['haproxy']['stats_socket_user'] = node['haproxy']['user']
default['haproxy']['stats_socket_group'] = node['haproxy']['group']
default['haproxy']['pid_file'] = '/var/run/haproxy.pid'

default['haproxy']['defaults_options'] = ['httplog', 'dontlognull', 'redispatch']
default['haproxy']['x_forwarded_for'] = false
default['haproxy']['defaults_timeouts']['connect'] = '5s'
default['haproxy']['defaults_timeouts']['client'] = '50s'
default['haproxy']['defaults_timeouts']['server'] = '50s'
default['haproxy']['cookie'] = nil

default['haproxy']['global_max_connections'] = 4096
default['haproxy']['member_max_connections'] = 100

# plus 10 frontend connections
default['haproxy']['frontend_max_connections'] = 5006
default['haproxy']['frontend_ssl_max_connections'] = 2000

default['haproxy']['install_method'] = 'package'
default['haproxy']['conf_dir'] = '/etc/haproxy'


default['haproxy']['source']['prefix'] = '/usr/local'
default['haproxy']['source']['target_os'] = 'generic'
default['haproxy']['source']['target_cpu'] = ''
default['haproxy']['source']['target_arch'] = ''
default['haproxy']['source']['use_pcre'] = false
default['haproxy']['source']['use_openssl'] = false
default['haproxy']['source']['use_zlib'] = false

# Optimization - RS
default['haproxy']['config']['defaults']['options'] = []
default['haproxy']['source']['prefix'] = '/usr/local'
default['haproxy']['source']['target_os'] = 'linux2628'
default['haproxy']['source']['target_cpu'] = 'x86_64'
default['haproxy']['source']['use_pcre'] = true
default['haproxy']['source']['use_openssl'] = true
default['haproxy']['source']['use_zlib'] = true
