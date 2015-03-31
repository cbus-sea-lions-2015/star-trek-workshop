class Roster < ActiveRecord::Base
  belongs_to :crew_member
  belongs_to :duty
end
