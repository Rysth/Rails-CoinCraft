class CreateCategoriesMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :categories_movements, id: false do |t|
      t.references :category, foreign_key: true
      t.references :movement, foreign_key: true
    end
  end
end
