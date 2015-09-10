class Group < ActiveRecord::Base
  belongs_to :trainer, class_name: "User"
  has_many  :users
  accepts_nested_attributes_for :users, :allow_destroy => false
end
