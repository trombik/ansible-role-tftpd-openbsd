require "spec_helper"

class ServiceNotReady < StandardError
end

sleep 10 if ENV["JENKINS_HOME"]

context "after provisioning finished" do
  describe server(:client1) do
    it "should be able to ping server" do
      result = current_server.ssh_exec("ping -c 1 #{server(:server1).server.address} && echo OK")
      expect(result).to match(/OK/)
    end
  end

  describe server(:server1) do
    it "should be able to ping client" do
      result = current_server.ssh_exec("ping -c 1 #{server(:client1).server.address} && echo OK")
      expect(result).to match(/OK/)
    end
  end

  describe server(:client1) do
    it "downloads /foo from tftpd" do
      r = current_server.ssh_exec("echo get foo | sudo tftp 192.168.21.200")
      expect(r).to match(/^tftp> Received 5 bytes in \d+\.\d+ seconds$/)
    end

    it "verifies the content" do
      r = current_server.ssh_exec("cat foo")
      expect(r).to match(/^foo$/)
    end
  end
end
