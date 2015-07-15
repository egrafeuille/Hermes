class CreateCycles < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.string :name
      t.text :notes
      t.date :start_date
      t.date :end_date
      t.decimal :volume, :precision => 8, :scale => 2, :default => 0

      t.timestamps null: false
    end
  end
end
