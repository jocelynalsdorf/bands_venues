ENV['RACK_ENV'] = 'test'
require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('the venue paths for bands and venues app', type: :feature) do
  describe('add venue functionality') do
    it('allow a user to add a venue') do
      visit('/')
      click_link('Click here for Venues!')
      fill_in('name', with: 'plaza')
      click_button('Add')
      expect(page).to(have_content('Plaza'))
    end
  end

  describe('add a venue to a specific band') do
    it('allow a user to add a venue to individual band') do
      band = Band.create(name: 'u2')
      visit("/bands/#{band.id}")
      fill_in('name', with: 'Roadhouse')
      click_button('Add Venue')
      expect(page).to(have_content('Roadhouse'))
    end
  end
end
