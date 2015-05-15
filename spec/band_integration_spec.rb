ENV['RACK_ENV'] = 'test'
require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('the band paths for bands and venues app', type: :feature) do
  describe('add band functionality') do
    it('allow a user to add a band') do
      visit('/')
      click_link('Click here for Bands')
      fill_in('name', with: 'u2')
      click_button('Add')
      expect(page).to(have_content('Success!'))
    end
  end

  describe('edit band name functionality') do
    it('allow a user to rename a band') do
      Band.create(name: 'Aliens')
      visit('/')
      click_link('Click here for Bands')
      click_link('Update this band')
      fill_in('name', with: 'Alienz')
      click_button('Update Band')
      expect(page).to(have_content('Alienz'))
    end
  end

  describe('delete a band') do
    it('allow a user to delete a band') do
      Band.create(name: 'radness')
      visit('/')
      click_link('Click here for Bands')
      click_link('Update this band')
      click_button('Delete')
      expect(page).to_not(have_content('radness'))
    end
  end

  describe('add a band to a venue') do
    it('allow a user to add a band to individual venue') do
      venue = Venue.create(name: 'Roadhouse')
      visit("/venues/#{venue.id}")
      fill_in('name', with: 'Rhcp')
      click_button('Add Band')
      expect(page).to(have_content('Rhcp'))
    end
  end
end
