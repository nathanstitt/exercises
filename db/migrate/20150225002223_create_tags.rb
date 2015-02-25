class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false

      t.timestamps null: false

      t.index :name, unique: true#, case_sensitive: false
    end
  end
end
