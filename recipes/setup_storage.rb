include_recipe "aws"

# access our aws credentials
aws = data_bag_item("aws", "main")

# access our aws credentials
aws = data_bag_item("aws", "main")

bookshare_ebs_btrfs "/var/lib/solr-home" do
  aws_access_key aws['aws_access_key_id']
  aws_secret_access_key aws['aws_secret_access_key']
  ebs_volume_type "gp2"
  number_of_volumes 2
  size_of_volumes 300
  raid_type "raid0"
  volume_label "postgres"
  mount_point_owner "solr"
  mount_point_group "root"
  mount_point_perms 00755
  mv_mnt_mv_rm false
end