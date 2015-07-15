class Macro < ActiveRecord::Base
  has_many :mesos, :dependent => :destroy
end
