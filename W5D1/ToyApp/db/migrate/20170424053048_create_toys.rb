class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.integer :toyable_id
      t.string :toyable_type

      t.timestamps null: false
    end
  end
end
