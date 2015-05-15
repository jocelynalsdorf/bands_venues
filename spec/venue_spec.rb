require('spec_helper')

describe(Venue) do
  it('has many bands') do
    venue = Venue.create(name: 'plaza')
    band1 = Band.create(name: 'u2', venue_ids: [venue.id])
    band2 = Band.create(name: 'sting', venue_ids: [venue.id])
    expect(venue.bands).to(eq([band1, band2]))
  end

  it('validates presence of name') do
    venue = Venue.new(name: '')
    expect(venue.save).to(eq(false))
  end

  it('validates name is 2 or more characters') do
    venue = Venue.new(name: 'r')
    expect(venue.save).to(eq(false))
  end

  it('validates name is 50 or fewer characters') do
    venue = Venue.new(name: 'r'*(51))
    expect(venue.save).to(eq(false))
  end
end
