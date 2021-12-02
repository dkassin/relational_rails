# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SoccerPlayer.destroy_all
SoccerTeam.destroy_all


rm = SoccerTeam.create!(name: 'Real Madrid', qualified_champ_league: true, points: 23)
bar = SoccerTeam.create!(name: 'Barcelona', qualified_champ_league: true, points: 13)
cad = SoccerTeam.create!(name: 'Cadiz CF', qualified_champ_league: false, points: 22)
bet = SoccerTeam.create!(name: 'Real Betis', qualified_champ_league: false, points: 11)
am = SoccerTeam.create!(name: 'Aletico Madrid', qualified_champ_league: true, points: 28)

rm.soccer_players.create!(name: 'Jimmy G', homegrown_player: false, games_played: 23)
rm.soccer_players.create!(name: 'Jay C', homegrown_player: true, games_played: 67)

bar.soccer_players.create!(name: 'Cay C', homegrown_player: true, games_played: 86)
bar.soccer_players.create!(name: 'Rob C', homegrown_player: true, games_played: 64)
bar.soccer_players.create!(name: 'Jose R', homegrown_player: false, games_played: 14)

cad.soccer_players.create!(name: 'Luis C', homegrown_player: false, games_played: 14)
cad.soccer_players.create!(name: 'Romeo F', homegrown_player: true, games_played: 34)
cad.soccer_players.create!(name: 'Tim G', homegrown_player: false, games_played: 124)
bet.soccer_players.create!(name: 'Jun F', homegrown_player: true, games_played: 202)

am.soccer_players.create!(name: 'Sam G', homegrown_player: false, games_played: 224)
am.soccer_players.create!(name: 'Ron L', homegrown_player: true, games_played: 104)


Mountain.destroy_all
MountainRange.destroy_all


rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
appalachian = MountainRange.create!(name: "Appalachian Mountains", has_ski_resort: true, included_states: 12)
cascade = MountainRange.create!(name: "Cascade Range", has_ski_resort: true, included_states: 3)
sierra = MountainRange.create!(name: "Sierra Nevada", has_ski_resort: false, included_states: 1)

rocky.mountains.create!(name: "Pikes Peak", volcanic: false, elevation: 14115)
rocky.mountains.create!(name: "Longs Peak", volcanic: false, elevation: 14259)
rocky.mountains.create!(name: "Bard Peak", volcanic: false, elevation: 13647)
rocky.mountains.create!(name: "Mount Herman", volcanic: false, elevation: 9063)

appalachian.mountains.create!(name: "Mount Washington", volcanic: false, elevation: 6288)
appalachian.mountains.create!(name: "Mount Mitchell", volcanic: false, elevation: 6684)
appalachian.mountains.create!(name: "Mount Katahdin", volcanic: false, elevation: 5268)
