RSpec.describe Ygoprodeck do
  it "check search by id" do
    expect(Ygoprodeck::ID.is("46986414")).not_to be nil
  end

  it "check search by id spesific" do
    spec_id = Ygoprodeck::ID.is("46986414")
    expect(spec_id["name"]).to eq("Dark Magician")
  end
end
