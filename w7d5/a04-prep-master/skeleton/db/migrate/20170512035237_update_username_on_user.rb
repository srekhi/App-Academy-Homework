class UpdateUsernameOnUser < ActiveRecord::Migration
  def change
    remove_column :users, :usernmae
    add_column :users, :username, :string
  end
end
