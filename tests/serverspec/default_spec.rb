require "spec_helper"
require "serverspec"

service = "tftpd"
ports   = [69]

describe file "/etc/rc.conf.local" do
  it { should exist }
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by "root" }
  it { should be_grouped_into "wheel" }
  its(:content) { should match(%r{^tftpd_flags=-v -4 /tftpboot$}) }
end

describe service(service) do
  it { should be_running }
  it { should be_enabled }
end

ports.each do |p|
  describe port(p) do
    it do
      pending "serverspec does not support OpenBSD's netstat"
      should be_listening
    end
  end
end
