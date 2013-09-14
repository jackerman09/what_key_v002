class AddUniqueNameToChords < ActiveRecord::Migration
  def change
    add_column :chords, :unique_name, :string
  end
end
