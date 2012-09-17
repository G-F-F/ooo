require "spec_helper"
require "faker"

class String
  def each &block
    split(" ").each &block
  end
end

class NilClass
  def include?(something)
    false
  end
end

describe PagesController do
  render_views # I'll try to fix it  
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'home'
      response.should have_selector("title", :content => "Home - Ooo")
    end
  end
  
  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'contact'
      response.should have_selector("title", :content => "Contact - Ooo")
    end
  end
  
  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'about'
      response.should have_selector("title", :content => "About - Ooo")
    end
  end
  it "is once again being tested with rspec"
  describe "You" do
    it "didn't get lucky. :-(" do
      get 'brainiacs'
      puts "\nconducting lucky test...\n"
      response.should have_selector("title", :content => "#{Faker::Lorem.sentence(1000)} - Ooo")
      puts "HEY YOU GOT LUCKY!! :-D\n"
    end
  end
end