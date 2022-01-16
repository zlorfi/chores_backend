class CreateManifests < ActiveRecord::Migration[6.1]
  def change
    create_table :manifests do |t|
      t.references :day, null: false, foreign_key: true
      t.references :chore, null: false, foreign_key: true
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
