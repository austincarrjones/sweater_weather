require "rails_helper"

RSpec.describe MapquestFacade do
  describe "#coordinates" do
    it "should return hash of user information on successful creation" do 
      VCR.use_cassette("mapquest_coordinates") do
        response = MapquestFacade.new.coordinates("Breckenridge,CO")

        expect(response).to be_a String
      end
    end

    xit "should return error hash if unsuccessful" do 
      VCR.use_cassette("mapquest_sad") do
        response = MapquestFacade.new.coordinates("z1")
     
        expect(response).to be_a Hash
        expect(response[:errors]).to be_a Hash
      end
    end
  end
end