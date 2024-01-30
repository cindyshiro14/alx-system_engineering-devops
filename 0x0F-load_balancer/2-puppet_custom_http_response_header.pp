# Puppet manifest to configure Nginx with a custom HTTP response header

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Define custom HTTP header parameters
$custom_header_name = 'X-Served-By'
$custom_header_value = $hostname

# Configure Nginx with custom header
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    server_name _;

    location / {
        add_header $custom_header_name $custom_header_value;
        proxy_pass http://backend;
    }
}
",
  notify  => Service['nginx'],
}

# Enable and start Nginx service
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}
