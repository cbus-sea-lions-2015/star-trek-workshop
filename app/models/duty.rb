class Duty < ActiveRecord::Base
  has_many :rosters
  has_many :crew_members, through: :rosters
end
