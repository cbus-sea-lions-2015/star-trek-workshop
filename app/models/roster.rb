class Roster < ActiveRecord::Base
  belongs_to :crew_members
  belongs_to :duties
end
