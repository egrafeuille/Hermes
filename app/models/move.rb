class Move < ActiveRecord::Base
  has_ancestry

  scope :macros, -> { where(type: 'Macro') } 
  scope :mesos, -> { where(type: 'Meso') }
  scope :micros, -> { where(type: 'Micro') }
  scope :nanos, -> { where(type: 'Nano') }
  scope :steps, -> { where(type: 'Step') }    

  def as_json(*args)
      super.tap { |hash| hash["text"] = hash.delete "name" }
  end

  def self.type
    %w(Macro Meso Micro Nano Step)
  end


end

class Macro < Move
#  has_many :mesos
end

class Meso < Move
#  has_many :micros
#  belongs_to :macro
end

class Micro < Move
#  has_many :nanos
#  belongs_to :meso
end

class Nano < Move
#  has_many :steps  
#  belongs_to :micro
end

class Step < Move
#  belongs_to :nano
end
