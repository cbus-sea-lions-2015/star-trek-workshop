class Ship < ActiveRecord::Base
  belongs_to :captain
  has_many :crew_members
  has_many :duties, through: :crew_members
end
