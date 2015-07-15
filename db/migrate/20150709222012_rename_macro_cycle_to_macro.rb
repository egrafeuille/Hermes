class RenameMacroCycleToMacro < ActiveRecord::Migration
  def change
     rename_table :macro_cycles, :macros
  end
end
