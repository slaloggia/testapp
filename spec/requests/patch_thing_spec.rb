require 'rails_helper'

RSpec.describe "PATCH thing route" do
    before(:all) do
        3.times do 
            Thing.create(name: Faker::Name.name)
        end
    end
    describe "update an existing Thing" do
        let!(:starting_db_count) { Thing.count }
        let!(:update_thing) { Thing.all.sample }
        before {patch "/things/#{update_thing.id}", params: {name: "New name"}}

        it "returns a successful status" do
            expect(response).to have_http_status(200)
        end

        it "updates attributes of the correct User" do
            expect(Thing.find(update_thing.id).name).to eq("New name")
        end

        it "does not add a new User instance to the database" do
            expect(Thing.count).to eq(starting_db_count)
        end
    end
end
