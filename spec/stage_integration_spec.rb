require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a stage path', {:type => :feature}) do
  it('creates a stage and then goes to the stage page') do
    visit('/festival')
    click_on('Add a new stage')
    fill_in('stage_name', :with => 'west stage')
    click_on('click here to build the stage!')
    expect(page).to have_content('west stage')
  end
end

describe('create an artist path', {:type => :feature}) do
  it('creates an artist and then goes to the artist page') do
    stage = Stage.new("Best stage ever", nil)
    stage.save
    visit("/stages/#{stage.id}")
    fill_in('artist_name', :with => 'best band ever')
    click_on('Add Artist')
    expect(page).to have_content("best band ever")
  end
end