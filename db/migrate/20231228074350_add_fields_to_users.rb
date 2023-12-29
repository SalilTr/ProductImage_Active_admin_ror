class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :dob, :date
    add_column :users, :mobile, :string
  end
end
