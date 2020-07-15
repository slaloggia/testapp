class AddNameToThing < ActiveRecord::Migration[6.0]
  def change
    add_column :things, :name, :string
  end
end
