class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks, id: :uuid do |t|
      t.references :day, type: :uuid, null: false, foreign_key: true
      t.references :chore, type: :uuid, null: false, foreign_key: true
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
