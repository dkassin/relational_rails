require 'rails_helper'

RSpec.describe 'the soccer teams index web page' do
  before :each do
    @rm = SoccerTeam.create!(name: 'Real Madrid', qualified_champ_league: true, points: 23)
    @bar = SoccerTeam.create!(name: 'Barcelona', qualified_champ_league: true, points: 13)
    @cad = SoccerTeam.create!(name: 'Cadiz CF', qualified_champ_league: false, points: 22)
    @bet = SoccerTeam.create!(name: 'Real Betis', qualified_champ_league: false, points: 11)
    @am = SoccerTeam.create!(name: 'Aletico Madrid', qualified_champ_league: true, points: 28)
  end
  it "will show the soccer teams" do

    visit "/soccer_teams"

    expect(page).to have_content(@rm.name)
    expect(page).to have_content(@bar.name)
    expect(page).to have_content(@cad.name)
    expect(page).to have_content(@bet.name)
    expect(page).to have_content(@am.name)
  end

  it "orders teams by created first and displays creation date" do

    visit "/soccer_teams"

    expect(page).to have_content(@rm.created_at)
    expect(page).to have_content(@bar.created_at)
    expect(page).to have_content(@cad.created_at)
    expect(page).to have_content(@bet.created_at)
    expect(page).to have_content(@am.created_at)
  end

  it "gives links to all indexes for all tables" do

    visit "/soccer_teams"

    click_on "Mountains Index"
    expect(current_path).to eq ("/mountains")
  end

  it "gives a link to create a soccer team" do

    visit "/soccer_teams"

    click_on "Add another Soccer Team"
    expect(current_path).to eq ("/soccer_teams/new")
  end

  it "it will show a link next to a team name, when clicked, it will take user to an edit page" do
    visit "/soccer_teams"

    click_on ("Edit #{@rm.name} info")

    expect(current_path).to eq ("/soccer_teams/#{@rm.id}/edit/")

  end

  it "it will show a link next to a team name, when clicked, it will delete the team" do
    visit "/soccer_teams"

    click_on ("delete #{@rm.name}")

    expect(current_path).to eq ("/soccer_teams")
    expect(page).to_not have_content(@rm.name)
  end


end
