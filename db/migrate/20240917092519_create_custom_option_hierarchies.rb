class CreateCustomOptionHierarchies < ActiveRecord::Migration[7.1]
  def change
    create_table :custom_option_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :custom_option_hierarchies, %i[ancestor_id descendant_id generations],
              unique: true,
              name: "custom_option_anc_desc_idx"

    add_index :custom_option_hierarchies, %i[descendant_id],
              name: "custom_option_desc_idx"
  end
end
