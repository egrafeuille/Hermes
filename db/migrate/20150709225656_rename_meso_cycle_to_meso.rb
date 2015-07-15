class RenameMesoCycleToMeso < ActiveRecord::Migration
  def change
    rename_table :meso_cycles, :mesos
  end
end
