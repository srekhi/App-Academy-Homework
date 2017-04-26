class AddNameToToys < ActiveRecord::Migration
  def change
    add_column :toys, :name, :string
  end
end
