class RenameMesoCycleToMesoInMicroCycleTable < ActiveRecord::Migration
  def change
    rename_column :micro_cycles, :meso_cycle_id, :meso_id
  end
end
