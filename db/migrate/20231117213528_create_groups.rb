class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.timestamp :created_at
    end

    add_reference :groups, :user, foreign_key: true
    add_reference :groups, :movement, foreign_key: true
  end
end
