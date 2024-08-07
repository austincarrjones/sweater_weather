require "rails_helper"

RSpec.describe MapquestFacade do
  describe "#coordinates" do
    it "should return hash of user information on successful creation" do 
      VCR.use_cassette("mapquest_coordinates") do
        response = MapquestFacade.new.coordinates("Breckenridge,CO")

        expect(response).to be_a String
      end
    end
  end
end