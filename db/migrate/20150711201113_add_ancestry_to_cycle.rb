class AddAncestryToCycle < ActiveRecord::Migration
  def change
    add_column :cycles, :ancestry, :string
    add_index :cycles, :ancestry 
  end
end
