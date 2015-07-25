class DropMesoTable < ActiveRecord::Migration
  def up
    drop_table :mesos
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
