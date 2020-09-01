require 'rails_helper'

RSpec.describe "GetPlaces", type: :request do
  describe "GET /get_places" do
    it "works! (now write some real specs)" do
      get get_places_index_path
      expect(response).to have_http_status(200)
    end
  end
end
