require 'rails_helper'

RSpec.describe "POST things route" do

    describe "create a new Thing" do
        let!(:starting_db_count) {Thing.count}
        before {post "/things", params: {name: Faker::Lorem.word}}

        it "returns a successful status" do
            expect(response).to have_http_status(200)
        end

        it "adds a new thing instance to the database" do
            expect(Thing.count).to eq(starting_db_count + 1)
        end
    end
end
