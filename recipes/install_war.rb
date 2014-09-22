instance_name =
if node['tomcat']['instances']['solr2']
  instance_name = "solr2"
else
  instance_name = "solr1"
end

#
# install the WAR
#

cookbook_file "solr-4.6.0.war" do
  path "/var/lib/tomcat6-#{instance_name}/webapps/ROOT.war"
  action :create
  owner "root"
  group "root"
  mode "0644"
end

#
# install logging JARs/config
#

cookbook_file "jcl-over-slf4j-1.6.6.jar" do
  path "/var/lib/tomcat6-#{instance_name}/lib/jcl-over-slf4j-1.6.6.jar"
  action :create
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "jul-to-slf4j-1.6.6.jar" do
  path "/var/lib/tomcat6-#{instance_name}/lib/jul-to-slf4j-1.6.6.jar"
  action :create
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "log4j-1.2.16.jar" do
  path "/var/lib/tomcat6-#{instance_name}/lib/log4j-1.2.16.jar"
  action :create
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "log4j.properties" do
  path "/var/lib/tomcat6-#{instance_name}/lib/log4j.properties"
  action :create
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "slf4j-api-1.6.6.jar" do
  path "/var/lib/tomcat6-#{instance_name}/lib/slf4j-api-1.6.6.jar"
  action :create
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "slf4j-log4j12-1.6.6.jar" do
  path "/var/lib/tomcat6-#{instance_name}/lib/slf4j-log4j12-1.6.6.jar"
  action :create
  owner "root"
  group "root"
  mode "0644"
end

#
# create core0 directories
#

directory "/var/lib/solr-home/core0" do
  owner "solr"
  group "root"
  mode 00755
  action :create
  recursive true
end

directory "/var/lib/solr-home/core0/conf" do
  owner "solr"
  group "root"
  mode 00755
  action :create
end

directory "/var/lib/solr-home/core0/data" do
  owner "solr"
  group "root"
  mode 00755
  action :create
end

#
# create core1 directories
#

directory "/var/lib/solr-home/core1" do
  owner "solr"
  group "root"
  mode 00755
  action :create
  recursive true
end

directory "/var/lib/solr-home/core1/conf" do
  owner "solr"
  group "root"
  mode 00755
  action :create
end

directory "/var/lib/solr-home/core1/data" do
  owner "solr"
  group "root"
  mode 00755
  action :create
end

#
# install solr.xml
#

template "/var/lib/solr-home/solr.xml" do
  source "solr.xml.erb"
  mode 0640
  owner "solr"
  group "root"
end

#
# install Solr config files for core0
#

cookbook_file "elevate.xml" do
  path "/var/lib/solr-home/core0/conf/elevate.xml"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

cookbook_file "mapping-ISOLatin1Accent.txt" do
  path "/var/lib/solr-home/core0/conf/mapping-ISOLatin1Accent.txt"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

cookbook_file "protwords.txt" do
  path "/var/lib/solr-home/core0/conf/protwords.txt"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

cookbook_file "schema.xml" do
  path "/var/lib/solr-home/core0/conf/schema.xml"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

cookbook_file "search.properties" do
  path "/var/lib/solr-home/core0/conf/search.properties"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

cookbook_file "solrconfig.xml" do
  path "/var/lib/solr-home/core0/conf/solrconfig.xml"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

cookbook_file "stopwords.txt" do
  path "/var/lib/solr-home/core0/conf/stopwords.txt"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

cookbook_file "synonyms.txt" do
  path "/var/lib/solr-home/core0/conf/synonyms.txt"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

#
# install Solr config files for core1
#

cookbook_file "elevate.xml" do
  path "/var/lib/solr-home/core1/conf/elevate.xml"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

cookbook_file "mapping-ISOLatin1Accent.txt" do
  path "/var/lib/solr-home/core1/conf/mapping-ISOLatin1Accent.txt"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

cookbook_file "protwords.txt" do
  path "/var/lib/solr-home/core1/conf/protwords.txt"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

cookbook_file "schema.xml" do
  path "/var/lib/solr-home/core1/conf/schema.xml"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

cookbook_file "search.properties" do
  path "/var/lib/solr-home/core1/conf/search.properties"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

cookbook_file "solrconfig.xml" do
  path "/var/lib/solr-home/core1/conf/solrconfig.xml"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

cookbook_file "stopwords.txt" do
  path "/var/lib/solr-home/core1/conf/stopwords.txt"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end

cookbook_file "synonyms.txt" do
  path "/var/lib/solr-home/core1/conf/synonyms.txt"
  action :create
  owner "solr"
  group "root"
  mode "0640"
end