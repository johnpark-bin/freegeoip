require 'spec_helper'

describe FreeGeoIP do
  before do
    VCR.use_cassette("locate") do
      @host = subject.locate("google-public-dns-a.google.com")
      @ip   = subject.locate("8.8.8.8")
    end
  end

  context "#locate" do
    it "should not break" do
      @host.should == @ip
    end
  end
end