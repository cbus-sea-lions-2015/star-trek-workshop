class Captain < ActiveRecord::Base
  has_one :ship
  has_many :crew_members, through: :ship
end
