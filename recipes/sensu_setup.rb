#
#
# senus configuration
#
#

directory "C:\\etc\\sensu\\client\\" do
  recursive true
  inherits false
  rights :read, "Everyone"
  rights :full_control, "svchrsuite"
  action :create
end

directory "C:\\etc\\sensu\\conf.d\\" do
  recursive true
  inherits false
  rights :read, "Everyone"
  rights :full_control, "svchrsuite"
  action :create
end

directory "C:\\opt\\sensu\\plugins\\" do
  recursive true
  inherits false
  rights :read, "Everyone"
  rights :full_control, "svchrsuite"
  action :create
end

cookbook_file "C:\\opt\\sensu\\plugins\\check-process.rb" do
  source "check-process.rb"
  rights :full_control, "svchrsuite"
end

cookbook_file "C:\\opt\\sensu\\plugins\\check-service.rb" do
  source "check-service.rb"
  rights :full_control, "svchrsuite"
end

cookbook_file "C:\\opt\\sensu\\plugins\\check-disk-windows.rb" do
  source "check-disk-windows.rb"
  rights :full_control, "svchrsuite"
end

cookbook_file "C:\\opt\\sensu\\plugins\\cpu-load-windows.rb" do
  source "cpu-load-windows.rb"
  rights :full_control, "svchrsuite"
end

cookbook_file "C:\\etc\\sensu\\client\\cert.pem" do
  source "cert.pem"
  rights :full_control, "svchrsuite"
end

cookbook_file "C:\\etc\\sensu\\client\\key.pem" do
  source "key.pem"
  rights :full_control, "svchrsuite"
end

cookbook_file "C:\\etc\\sensu\\conf.d\\rabbitmq.json" do
  source "rabbitmq.json"
  rights :full_control, "svchrsuite"
end

template "C:\\etc\\sensu\\conf.d\\client.json" do
  source "client.json.erb"
  rights :full_control, "svchrsuite"
end

cookbook_file "C:\\opt\\sensu\\bin\\sensu-client.xml" do
  source "sensu-client.xml"
  rights :full_control, "svchrsuite"
end

batch "install gems that are needed" do
  code <<-EOH
  c:\\opt\\sensu\\embedded\\bin\\gem install amq-client --version=1.0.2 --no-rdoc --no-ri
  c:\\opt\\sensu\\embedded\\bin\\gem install amqp --version 1.0.0 --no-rdoc --no-ri
  c:\\opt\\sensu\\embedded\\bin\\gem install em-redis-unified --no-rdoc --no-ri
  c:\\opt\\sensu\\embedded\\bin\\gem install em-worker --no-rdoc --no-ri
  c:\\opt\\sensu\\embedded\\bin\\gem install sensu --no-rdoc --no-ri
  c:\\opt\\sensu\\embedded\\bin\\gem install sensu-plugin --no-rdoc --no-ri
  c:\\opt\\sensu\\embedded\\bin\\gem install activesupport --no-rdoc --no-ri
  c:\\opt\\sensu\\embedded\\bin\\gem list > c:\\opt\\sensu\\gems_installed
  EOH
  creates "c:\\opt\\sensu\\gems_installed"
end


batch "enable sensu-client service" do
  code <<-EOH
  sc create sensu-client binPath= c:\\opt\\sensu\\bin\\sensu-client.exe DisplayName= "Sensu Client"
  sc query sensu-client > c:\\opt\\sensu\\enabled
  EOH
  creates "c:\\opt\\sensu\\enabled"
end

batch "start up sensu-client" do
  code <<-EOH
   sc start sensu-client
   sc query sensu-client > c:\\opt\\sensu\\running
  EOH
  creates "c:\\opt\\sensu\\running"
end


