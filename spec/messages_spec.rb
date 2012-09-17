require "spec_helper"
describe "rspec" do
  it "is no longer undergoing any problems!\n  YAY!"
  it "WORKS!"
  describe "hopefully" do
    it "will not go crazy" do
      should_not be_nil
    end
    it "will stay working"
  end
  describe "probably" do
    it "will continue to work"
  end
end