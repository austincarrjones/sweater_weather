require "rails_helper"

RSpec.describe CombinedFacade do
  describe "#coordinates" do
    it "should return hash" do 
      VCR.use_cassette("current_weather") do
        response = CombinedFacade.new.coordinates("Breckenridge,CO")

        expect(response).to be_a String
      end
    end

    xit "should return error hash if unsuccessful" do 
      VCR.use_cassette("Combined_sad") do
        response = CombinedFacade.new.coordinates("z1")
     
        expect(response).to be_a Hash
        expect(response[:errors]).to be_a Hash
      end
    end
  end
end