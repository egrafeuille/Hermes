class Meso < ActiveRecord::Base
  belongs_to :macros
  has_many :micros, :dependent => :destroy
end
