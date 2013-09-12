class CreateKeychords < ActiveRecord::Migration
  def change
    create_table :keychords do |t|
      t.integer :key_id
      t.integer :chord_id

      t.timestamps
    end
  end
end
