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
