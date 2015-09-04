class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  validates :username, presence: true, uniqueness: true  
  validates :password, presence: true, confirmation: true, length: { in: 6..20 }
  validates :password_confirmation, presence: true
  validates :email, presence: true
  validates :sex, inclusion: { in: %w(M F U) }
  validates :type, inclusion: { in: %w(Trainer Player) }
  validates :trainer_id, presence: true , unless: "type=='Trainer'"
  scope :trainers, -> { where(type: 'Trainer') }
  scope :players, -> { where(type: 'Player') }
    
  def self.inheritance_column
    :no_such_column_because_we_dont_want_type_casting
  end
end


# class Trainer < User
  # authenticates_with_sorcery!
# end
# 
# class Player < User
  # authenticates_with_sorcery!
# end