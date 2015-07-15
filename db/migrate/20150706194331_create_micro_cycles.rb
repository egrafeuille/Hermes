class CreateMicroCycles < ActiveRecord::Migration
  def change
    create_table :micro_cycles do |t|
      t.integer :meso_cycle_id
      t.string :name
      t.text :notes
      t.decimal :volume, :precision => 8, :scale =>2

      t.timestamps null: false
    end
  end
  def self.down
    drop_table :micro_cycles
  end
end
