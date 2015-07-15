class RenameMacroCycleToMacroInMesoCycleTable < ActiveRecord::Migration
  def change
    rename_column :meso_cycles, :macro_cycle_id, :macro_id
  end
end
