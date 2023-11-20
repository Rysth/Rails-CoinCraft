class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.timestamp :created_at
    end

    add_reference :categories, :user, foreign_key: true
  end
end
