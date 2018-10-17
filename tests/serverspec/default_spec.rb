require "spec_helper"
require "serverspec"

config = "/etc/doas.conf"

describe file config do
  it { should be_file }
  it { should be_mode 640 }
  it { should be_owned_by "root" }
  it { should be_grouped_into "wheel" }
  its(:content) { should match(/^# Managed by ansible$/) }
  its(:content) { should match(/^permit nopass vagrant as root cmd sysctl$/) }
end

describe command "doas -n sysctl -n net.inet.ip.forwarding", sudo: false do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should eq "" }
  its(:stdout) { should match(/^0$/) }
end
