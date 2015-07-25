class DropMacroTable < ActiveRecord::Migration
  def up
    drop_table :macros
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
