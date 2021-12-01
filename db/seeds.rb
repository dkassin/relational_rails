# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SoccerPlayer.destroy_all
SoccerTeams.destroy_all


rm = SoccerTeams.create!(name: 'Real Madrid', qualified_champ_league: true, points: 23)
bar = SoccerTeams.create!(name: 'Barcelona', qualified_champ_league: true, points: 13)
cad = SoccerTeams.create!(name: 'Cadiz CF', qualified_champ_league: false, points: 22)
bet = SoccerTeams.create!(name: 'Real Betis', qualified_champ_league: false, points: 11)
am = SoccerTeams.create!(name: 'Aletico Madrid', qualified_champ_league: true, points: 28)

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
MountainRanges.destroy_all


rocky = MountainRanges.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
appalachian = MountainRanges.create!(name: "Appalachian Mountains", has_ski_resort: true, included_states: 12)
cascade = MountainRanges.create!(name: "Cascade Range", has_ski_resort: true, included_states: 3)
sierra = MountainRanges.create!(name: "Sierra Nevada", has_ski_resort: false, included_states: 1)

rocky.mountains.create!(name: "Rey", volcanic: true, elevation: 12311)
rocky.mountains.create!(name: "Kathy", volcanic: true, elevation: 13311)
