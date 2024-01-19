# 0-create_a_file.pp

# Ensure the directory /tmp exists
file { '/tmp':
  ensure => 'directory',
}

# Create the file /tmp/school
file { '/tmp/school':
  ensure   => 'file',
  mode     => '0744',
  owner    => 'www-data',
  group    => 'www-data',
  content  => 'I love Puppet',
}
