class CreateChores < ActiveRecord::Migration[6.1]
  def change
    create_table :chores do |t|
      t.text :title
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday

      t.timestamps
    end
  end
end
