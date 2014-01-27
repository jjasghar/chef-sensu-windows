#
#
# packages that should be installed
#
#

# sensu install
windows_package "sensu 0.10.2-1" do
  source "http://repos.sensuapp.org/msi/sensu-0.10.2-1.msi"
  installer_type :msi
  action :install
end


