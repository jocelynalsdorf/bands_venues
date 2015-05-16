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
    redirect back
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
    redirect back
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
  if @venue.save()
    redirect back
  else
    erb(:errors)
  end
end

get ('/venues/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  #@bands = @venue.bands()
  @bands = Band.all()
  erb(:venue)
end

post('/venues/:id/bands') do
  id = params.fetch("id").to_i()
  @venue = Venue.find(id)
  name = params.fetch("name")
  @band = Band.new({:name => name, :venue_ids => [id]})
  if @band.save()
    redirect back
  else
    erb(:errors)
  end
end

post("/venues/:id") do
  venue_id = params.fetch("id").to_i()
  @venue = Venue.find(venue_id)
  band_ids = params.fetch("band_ids")
  x = Band.find(band_ids)
  @venue.bands.push(x)
  @bands = Band.all()
 
  redirect back

end

