class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.text :notes
      t.integer :times
      t.decimal :distance, :precision => 8, :scale => 3, :default => 0
      t.time :duration
      t.time :pace
      t.integer :intensity
      t.time :rest
      # t.references :nano, index: true, foreign_key: true
      t.integer :nano_id

      t.timestamps null: false
    end
  end
end
