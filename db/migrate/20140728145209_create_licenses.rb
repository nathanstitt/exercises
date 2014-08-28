class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :name, null: false
      t.string :short_name, null: false
      t.string :url, null: false
      t.text :publishing_contract, null: false
      t.text :copyright_notice, null: false
      t.boolean :is_public_domain, null: false, default: false

      t.timestamps
    end

    add_index :licenses, :name, unique: true
    add_index :licenses, :short_name, unique: true
    add_index :licenses, :url, unique: true
  end
end
