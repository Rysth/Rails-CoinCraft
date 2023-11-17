class CreateMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :movements do |t|
      t.integer :author_id
      t.string :name
      t.float :amount
      t.timestamp :created_at

    end
    
    add_foreign_key :movements, :users, column: :author_id
  end
end
