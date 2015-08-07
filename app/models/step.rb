class Step < ActiveRecord::Base
  belongs_to :moves
  
  validates :name, :notes, presence: true
  validates :start_date, presence: true
  validates :distance, numericality: true 
  
end
