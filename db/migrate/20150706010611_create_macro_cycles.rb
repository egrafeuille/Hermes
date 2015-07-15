class CreateMacroCycles < ActiveRecord::Migration
  def change
    create_table :macro_cycles do |t|
      t.string :name
      t.text :notes
      t.date :startDate
      t.date :endDate
      t.decimal :volume, :precision => 8, :scale =>2

      t.timestamps null: false
    end
  end
  def self.down
    drop_table :macros
  end
end
