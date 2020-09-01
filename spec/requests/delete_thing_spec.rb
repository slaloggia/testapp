require 'rails_helper'

RSpec.describe "DELETE things route" do
    before(:all) {
        3.times do 
            Thing.create(name: Faker::Lorem.word)
        end
    }

    describe "delete Thing" do
        let!(:id) {Thing.all.sample.id}
        let!(:starting_db_count) {Thing.count}
        before {delete "/things/#{id}"}

        it "adds a new thing instance to the database" do
            expect(Thing.count).to eq(starting_db_count - 1)
        end
    end
end
