require 'rails_helper'

RSpec.describe "PATCH things route" do
    before(:all) do
        10.times do 
            Thing.create(name: Faker::Lorem.word)
        end
        @things = Thing.all
        @starting_db_count = Thing.count
    end
    describe "update an existing Thing" do
        let!(:update_thing) { @things.sample }
        before {patch "/things/#{update_thing.id}", params: {name: "New name"}}

        it "returns a successful status" do
            expect(response).to have_http_status(200)
        end

        it "updates attributes of the correct Thing" do
            expect(Thing.find(update_thing.id).name).to eq("New name")
        end

        it "does not add a new thing instance to the database" do
            expect(Thing.count).to eq(@starting_db_count)
        end
    end
end
