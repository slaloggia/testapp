class CreateThings < ActiveRecord::Migration[6.0]
  def change
    create_table :things do |t|

      t.timestamps
    end
  end
end
