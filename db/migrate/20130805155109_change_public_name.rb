class ChangePublicName < ActiveRecord::Migration
  def change
  	rename_column :keys, :public, :is_public
  end
end
