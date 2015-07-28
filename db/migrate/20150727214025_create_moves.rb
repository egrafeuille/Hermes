class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :type
      t.string :name
      t.text :notes
      t.datetime :start_date
      t.datetime :end_date
      t.integer :times
      t.decimal :distance, :precision => 8, :scale => 3, :default => 0
      t.time :duration
      t.time :pace
      t.integer :intensity
      t.time :rest
      t.string :ancestry

      t.timestamps null: false
    end
    add_index :moves, :ancestry 
  end
end
