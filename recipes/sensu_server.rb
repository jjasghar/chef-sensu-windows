#
#
# sensu server configs
#
#

cookbook_file "/etc/sensu/conf.d/checks/check_disk-windows.json" do
  source "check_disk-windows.json"
end


