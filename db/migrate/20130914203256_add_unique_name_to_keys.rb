class AddUniqueNameToKeys < ActiveRecord::Migration
  def change
    add_column :keys, :unique_name, :string
  end
end
