require 'faker'

# 2 captains
# 2 ships
# 10 crew members per ship
# 5 duties

jlp = Captain.create!(name: "Jean Luc Picard", username: "jlp", password: "earlgrey")
jtk = Captain.create!(name: "James T. Kirk", username: "jtk", password: "babes")

jlp.ship = Ship.create!(name: "USS Enterprise D")
jtk.ship = Ship.create!(name: "USS Enterprise A")

10.times do
  jlp.ship.crew_members.create!(name: Faker::Name.name, rank: ["Ensign", "Commander", "Lieutenaint"].sample)
end

10.times do
  jtk.ship.crew_members.create!(name: Faker::Name.name, rank: ["Ensign", "Commander", "Lieutenaint"].sample)
end

Duty.create!(name: "Feed Tribbles")
Duty.create!(name: "Clean 10 forward")
Duty.create!(name: "Navigate")
Duty.create!(name: "Maintenance the replicator")
Duty.create!(name: "Have Fun")

CrewMember.all.each do |crew_member|
  crew_member.responsibilities << Duty.all.sample(2)
end
