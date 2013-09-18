class AddUniqueNameToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :unique_name, :string
  end
end
