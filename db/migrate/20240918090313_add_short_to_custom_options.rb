class AddShortToCustomOptions < ActiveRecord::Migration[7.1]
  def change
    add_column :custom_options, :short, :text
  end
end
