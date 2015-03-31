class CrewMember < ActiveRecord::Base
  belongs_to :ship
  has_many :rosters
  has_many :responsibilities, through: :rosters, source: :duty
end
