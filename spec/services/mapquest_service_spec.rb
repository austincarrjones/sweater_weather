require "rails_helper"

RSpec.describe MapquestService do
  describe "#coordinates" do
    it "should return a response body parsed from JSON" do
      VCR.use_cassette("mapquest_coordinates") do
        parsed_json = MapquestService.new.coordinates("Breckenridge,CO")

        expect(parsed_json).to be_a Hash
        expect(parsed_json[:lat]).to be_a Float
        expect(parsed_json[:lng]).to be_a Float
      end
    end
  end
end