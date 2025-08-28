RSpec.describe Ygoprodeck do
  it "check DB Ygoprodeck version" do
    expect(Ygoprodeck::CheckDbVer.info).not_to be nil
  end
end
