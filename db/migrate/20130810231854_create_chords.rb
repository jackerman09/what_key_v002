class CreateChords < ActiveRecord::Migration
  def change
    create_table :chords do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.boolean :is_public

      t.timestamps
    end
    add_index :chords, :is_public
  end
end
