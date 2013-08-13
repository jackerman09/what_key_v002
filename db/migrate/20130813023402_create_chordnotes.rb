class CreateChordnotes < ActiveRecord::Migration
  def change
    create_table :chordnotes do |t|
      t.integer :note_id
      t.integer :chord_id

      t.timestamps
    end
  end
end
