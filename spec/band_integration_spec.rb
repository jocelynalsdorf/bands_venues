ENV['RACK_ENV'] = 'test'
require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('the paths for bands and venues app', type: :feature) do
  # describe('add band functionality') do
  #   it('allow a user to add a band') do
  #     visit('/')
  #     fill_in('name', with: 'u2')
  #     click_button('Add')
  #     expect(page).to(have_content('u2'))
  #   end
  end
