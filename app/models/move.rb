class Move < ActiveRecord::Base
  
  has_ancestry
  has_many :steps
  accepts_nested_attributes_for :steps, :allow_destroy => true
  validates :name, :notes, presence: true
  validates :start_date, presence: true
  validates :distance, numericality: true
  scope :macros, -> { where(type: 'Macro') } 
  scope :mesos, -> { where(type: 'Meso') }
  scope :micros, -> { where(type: 'Micro') }
  scope :nanos, -> { where(type: 'Nano') }
  
  def as_json(*args)
    super.tap { |hash| hash["text"] = hash.delete "name" }
  end

  def self.type
    %w(Macro Meso Micro Nano)
  end

  def self.inheritance_column
    :no_such_column_because_we_dont_want_type_casting
  end
  
  def planned_distance
    planned_distance = 0
    if type == "Nano"
      planned_distance = steps.to_a.sum { |step| step.times * step.distance}
    else
      planned_distance = children.to_a.sum { |child| child.type == "Nano" ? child.distance : child.planned_distance }
    end
  end
end


  

