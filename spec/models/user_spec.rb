require 'rails_helper'

RSpec.describe User, type: :model do
  let(:raffle) { Raffle.create(name: "raffle 1") }

  subject {
    described_class.new(email: "test@example.com",
                        password: "123456",
                        password_confirmation: "123456",
                        raffle_id: raffle.id)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without email formate" do
    subject.email = "text.com"
    expect(subject).to_not be_valid
  end

  it "is not valid without raffle" do
    subject.raffle_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without raffle" do
    subject.raffle_id = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it "belongs_to raffle" do
      assc = described_class.reflect_on_association(:raffle)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
