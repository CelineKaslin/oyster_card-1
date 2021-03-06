require "card"
describe Card do
  it "have a balance of zero" do
    expect(subject.balance).to eq 0
  end

  it "should respond to the top up method" do
    expect(subject).to respond_to :top_up
  end

  it "should add the money to the excistent balance" do
    card = Card.new
    expect(card.top_up(20)).to eq 20
  end

  it "should raise error if balance exceeds 90" do
    maximum = Card::LIMIT
    subject.top_up(maximum)
    expect{subject.top_up(1)}.to raise_error "limit exceeded"
  end

  it 'should deduct money from the balance' do 
    card = Card.new
    subject.top_up(20)
    expect(subject.deduct(10)).to eq 10
  end

end
