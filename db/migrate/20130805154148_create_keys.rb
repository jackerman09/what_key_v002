class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.boolean :public

      t.timestamps
    end
    add_index :keys, :public
  end
end
