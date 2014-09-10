include_recipe "aws"

# access our aws credentials
aws = data_bag_item("aws", "main")

package "btrfs-tools" do
  action :upgrade
end

# create 6 disks to put in a raid10 array for solr
# /dev/sd[f-p] is amazons recommended
# http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-attaching-volume.html#device_naming
device_letters = *('f'..'p')
created_devices = []

i = 0
while i < 6
  devname = "/dev/sd#{device_letters.pop}"
  # setup ebs volumes
  aws_ebs_volume "solr_vol#{i}" do
    aws_access_key aws['aws_access_key_id']
    aws_secret_access_key aws['aws_secret_access_key']
    size 100
    volume_type "gp2"
    device devname
    action [ :create, :attach ]
  end
  created_devices.push(devname)
  i+=1
end

xvdevs  = created_devices.map{ |dev| dev.gsub("sd", "xvd")}

execute "mkfs.btrfs -f -L solr -d raid0#{xvdevs.map{ |dev| " #{dev}" }*''}" do
  not_if "file -s#{xvdevs.map{ |dev| " #{dev}" }*''} | grep -q BTRFS" # super hacky, we need a better idempotent check
end

solr_home = '/var/lib/solr-home'

directory solr_home do
  owner "solr"
  group "j2ee"
  mode 00700
  action :create
  recursive true
end

mount solr_home do
  device "solr"
  device_type :label
  fstype "btrfs"
  options "defaults," + xvdevs.map{ |dev| "device=#{dev}"}*","
  action [:mount, :enable]
end