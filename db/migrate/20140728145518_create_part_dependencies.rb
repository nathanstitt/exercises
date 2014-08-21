class CreatePartDependencies < ActiveRecord::Migration
  def change
    create_table :part_dependencies do |t|
      t.sortable
      t.references :parent_part, null: false
      t.references :dependent_part, null: false

      t.timestamps
    end

    add_sortable_index :part_dependencies, :dependent_part_id
    add_index :part_dependencies, [:parent_part_id, :dependent_part_id], unique: true,
              name: 'index_part_dependencies_on_p_p_id_and_d_p_id'
  end
end
