class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.boolean :can_edit, default: false
      t.string :name, null: false, default: ''

      t.timestamps
    end
  end
end
