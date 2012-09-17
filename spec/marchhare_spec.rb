require "spec_helper"
describe "marchhare" do
  it "should be able to connect to the internet" do
    `curl --head www.google.com`.split("\r\n")[0].should == "HTTP/1.1 200 OK"
  end
end