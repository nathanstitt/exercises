class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :part, null: false
      t.text :stem, null: false

      t.timestamps null: false
    end

    add_index :questions, :part_id
  end
end
