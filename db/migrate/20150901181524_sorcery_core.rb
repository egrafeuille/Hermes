class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,         :null => false
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.date   :birthDate
      t.string :sex,              :limit => 1
      t.string :type
      t.integer :trainer_id

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end