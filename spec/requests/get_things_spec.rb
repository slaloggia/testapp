require 'rails_helper'

RSpec.describe "GET routes" do
    before(:all) do
        10.times do 
            Thing.create(name: Faker::Lorem.word)
        end
        @things = Thing.all
    end

    describe "get all things route", type: :request do
        before { get "/things"}

        it "returns all things" do
            expect(JSON.parse(response.body).size).to eq(10)
        end

        it "returns status code 200" do
            expect(response).to have_http_status(:success)
        end
    end

    describe "get one thing route", type: :request do
        let!(:id) { @things.sample.id }
        before { get "/things/#{id}" }

        it "returns status code 200" do
            expect(response).to have_http_status(:success)
        end
        
        it "returns the correct thing" do
            expect(JSON.parse(response.body)['name']).to eq(Thing.find(id).name)
        end
    end
end