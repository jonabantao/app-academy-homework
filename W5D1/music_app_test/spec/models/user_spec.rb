# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6).on(:create) }
  end

  describe '#is_password?' do
    it 'verfies correct password' do
      expect(user.is_password?(user.password)).to be true
    end

    it 'rejects incorrect password' do
      expect(user.is_password?("smashthestate")).to be false
    end
  end

  describe '#reset_session_token!' do
    it 'should change session_token when calling reset_session_token!' do
      cookie1 = user.session_token
      cookie2 = user.reset_session_token!
      expect(cookie1).to_not eq(cookie2)
    end
  end

  describe "::find_by_credentials" do
    before { user.save! }

    it "returns user given good credentials" do
      expect(User.find_by_credentials(user.email, user.password)).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials(user.email, "smashthestate")).to eq(nil)
    end
  end
end
