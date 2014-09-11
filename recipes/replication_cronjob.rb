cron_d 'replicate-live-solr-index' do
  minute  0
  hour    0
  day     6
  command "curl http://solr1.#{node.chef_environment}.bookshare.org:8080/core0/replication?command=fetchindex"
  user    'root'
  mailto  'sysadmin@bookshare.org'
  path    '/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bookshare/sbin:/usr/local/bookshare/bin:/usr/local/bin'
end