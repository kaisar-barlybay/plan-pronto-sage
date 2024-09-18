class AddParentIdToCustomOption < ActiveRecord::Migration[7.1]
  def change
    add_column :custom_options, :parent_id, :integer
  end
end
