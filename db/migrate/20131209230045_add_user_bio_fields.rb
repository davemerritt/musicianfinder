class AddUserBioFields < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :postal_code, :string
    add_column :users, :bio, :text
  end
end
