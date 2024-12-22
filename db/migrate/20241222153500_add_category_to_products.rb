class AddCategoryToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :category, :string, null: false, default: "Uncategorized"
  end
end
