RSpec.describe Ygoprodeck do
  it "check search by fuzzy name" do
    expect(Ygoprodeck::Fname.is('dark magician')).not_to be nil
  end

  it "check search by fuzzy name spesific" do
    spec_name = Ygoprodeck::Fname.is('dark magician')
    expect(spec_name['id']).to eq(46986421)
  end
end
