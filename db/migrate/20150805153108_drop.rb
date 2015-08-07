class Drop < ActiveRecord::Migration
  def change
    change_table :moves do |t|
      t.remove :times
      t.remove :intensity
      t.remove :pace
      t.remove :rest
    end
  end
end
