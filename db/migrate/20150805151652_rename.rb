class Rename < ActiveRecord::Migration
  def change
    rename_column :steps, :nano_id, :naano_id
  end
end
