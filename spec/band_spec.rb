require('spec_helper')

describe(Band) do
  it('has many venues') do
    band = Band.create(name: 'red')
    venue1 = Venue.create(name: 'hilton', band_ids: [band.id])
    venue2 = Venue.create(name: 'ramada', band_ids: [band.id])
    expect(band.venues).to(eq([venue1, venue2]))
  end

  it('validates presence of name') do
    band = Band.new(name: '')
    expect(band.save).to(eq(false))
  end

  it('validates name is 2 or more characters') do
    band = Band.new(name: 'r')
    expect(band.save).to(eq(false))
  end

  it('validates name is 50 or fewer characters') do
    band = Band.new(name: 'r'*(51))
    expect(band.save).to(eq(false))
  end
end
