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
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6).on(:create) }
  end

  describe '#is_password?' do
    test_user = User.new
    test_user.password = "tester"

    it 'verfies correct password' do
      expect(test_user.is_password?("tester")).to be true
    end

    it 'rejects incorrect password' do
      expect(test_user.is_password?("notmypassword")).to be false
    end
  end

  describe '#reset_session_token!' do
    test_cookie = User.new
    cookie1 = test_cookie.reset_session_token!
    cookie2 = test_cookie.reset_session_token!

    it 'should change session_token when calling reset_session_token!' do
      expect(cookie1).to_not eq(cookie2)
    end
  end

  # Uses factory which is supposedly covered "tomorrow"
  # describe ".find_by_credentials" do
  #   before { user.save! }
  #
  #   it "returns user given good credentials" do
  #     expect(User.find_by_credentials("jonathan@fakesite.com", "good_password")).to eq(user)
  #   end
  #
  #   it "returns nil given bad credentials" do
  #     expect(User.find_by_credentials("jonathan@fakesite.com", "bad_password")).to eq(nil)
  #   end
  # end
end
