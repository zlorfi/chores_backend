class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.date :created_at
      t.datetime :updated_at
    end
  end
end
