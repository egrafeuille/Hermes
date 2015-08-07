class RenameStepColumn < ActiveRecord::Migration
  def change
        rename_column :steps, :naano_id, :move_id
  end
end
