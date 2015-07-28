class AddTypeToCycle < ActiveRecord::Migration
  def change
    add_column :cycles, :type, :string
  end
end
