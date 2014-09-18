if node['tomcat']['instances']['solr2']
  case node.chef_environment
    when "qa"
      default["solr"]["repl"]["master_url"] = "http://solr1.qa.bookshare.org:8080/core0/replication"
    when "staging"
      default["solr"]["repl"]["master_url"] = "http://solr1.staging.bookshare.org:8080/core0/replication"
    when "live"
      default["solr"]["repl"]["master_url"] = "http://solr1.bookshare.org:8080/core0/replication"
  end
  default["solr"]["repl"]["interval"] = "00:01:00"
end


if node['tomcat']['instances']['solr1']
  case node.chef_environment
    when "qa", "staging"
      default["solr"]["repl"]["master_url"] = "http://solr1.bookshare.org:8080/core0/replication"
    when "live"
      default["solr"]["repl"]["master_url"] = ""
  end
  default["solr"]["repl"]["interval"] = "00:00:00"
end