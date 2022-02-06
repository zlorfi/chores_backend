class AddEditRightsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :can_edit, :boolean, default: false
    add_column :users, :name, :string, null: false, default: ''
  end
end
