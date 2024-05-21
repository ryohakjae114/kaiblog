class CreateRelationships < ActiveRecord::Migration[7.1]
  def change
    create_table :relationships do |t|
      t.integer :following_id, null: false
      t.integer :followed_id, null: false

      t.timestamps
    end
    add_foreign_key :relationships, :users, column: :following_id
    add_foreign_key :relationships, :users, column: :followed_id
    add_index :relationships, %i[following_id followed_id], unique: true
  end
end
