class Cycle < ActiveRecord::Base
  has_ancestry

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


end

# class Macro < Cycle
# #  has_many :mesos
# end
# 
# class Meso < Cycle
# #  has_many :micros
# #  belongs_to :macro
# end
# 
# class Micro < Cycle
# #  has_many :nanos
# #  belongs_to :meso
# end
# 
# class Nano < Cycle
# #  belongs_to :micro
# end
