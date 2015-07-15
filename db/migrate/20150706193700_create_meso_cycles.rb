class CreateMesoCycles < ActiveRecord::Migration
  def change
    create_table :meso_cycles do |t|
      t.integer :macro_cycle_id
      t.string :name
      t.text :notes
      t.decimal :volume, :precision => 8, :scale =>2

      t.timestamps null: false
    end
  end
  def self.down
    drop_table :meso_cycles
  end  
end
