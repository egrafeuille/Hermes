class RenameMicroCycleToMicro < ActiveRecord::Migration
  def change
    rename_table :micro_cycles, :micros
  end
end
