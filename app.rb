require('bundler/setup')
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }



get('/') do
  erb(:index)
end

get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

post('/bands') do
  name = params.fetch('name')
  @new_band = Band.new({:name => name})
  if @new_band.save()
    erb(:success)
  else
    erb(:errors)
  end
end

get('/bands/:id/edit') do
  @band = Band.find(params.fetch('id').to_i)
  erb(:edit_band)
end

patch('/bands/:id') do
  name = params.fetch('name')
  @band = Band.find(params.fetch('id').to_i)
  @band.update({:name => name})
  @bands = Band.all()
  erb(:bands)
end

delete('/bands/:id') do
  @band = Band.find(params.fetch('id').to_i)
  @band.delete()
  @bands = Band.all()
  erb(:bands)
end

get '/venues' do
  @venues = Venue.all()
  erb(:venues)
end

post('/venues') do
  name = params.fetch('name')
  @new_venue = Venue.new({:name => name})
  if @new_venue.save()
    erb(:success)
  else
    erb(:errors)
  end
end

get ('/bands/:id') do
  @band = Band.find(params.fetch("id").to_i())
  @venues = @band.venues()
  erb(:band)
end

post('/bands/:id/venues') do
  id = params.fetch("id").to_i()
  @band = Band.find(id)
  name = params.fetch("name")
  @venue = Venue.new({:name => name, :band_ids => [id]})
  #@venue = @band.venues().new(name: name)
  if @venue.save()
    erb(:band)
  else
    erb(:error)
  end
end
