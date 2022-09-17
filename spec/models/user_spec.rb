require 'rails_helper'

RSpec.describe User, type: :model do
  subject {described_class.new(email: "test@example.com", password: "foobar123", password_confirmation: "foobar123")}

  describe "user" do
    it "creates a valid new user" do
      expect(subject).to be_valid
    end

    it "creates an ivalid user by not including password confirmation" do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it "creates an ivalid user by not including password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "creates an ivalid user by not including email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "creates an ivalid user by having a password that is too short" do
      subject.password_confirmation = "pass"
      subject.password = "pass"
      expect(subject).to_not be_valid
    end

    it "creates an ivalid user by having a password that is too long" do
      subject.password_confirmation = "thisisaverylongpasswordthatisinvalid"
      subject.password = "thisisaverylongpasswordthatisinvalid"
      expect(subject).to_not be_valid
    end


  end

  describe "random_name" do
    it "returns a random system generated name" do
      test_user2 = described_class.create(email: "email@example.com", password: "foobar123", password_confirmation: "foobar123")
      expect(test_user2.pseudo_name.class).to eq String
    end

  end

end
