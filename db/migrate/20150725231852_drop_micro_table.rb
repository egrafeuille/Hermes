class DropMicroTable < ActiveRecord::Migration
  def up
    drop_table :micros
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
