# == Schema Information
#
# Table name: albums
#
#  id            :integer          not null, primary key
#  title         :string           not null
#  year          :integer          not null
#  is_live_album :boolean          default(FALSE), not null
#  band_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :year, presence: true
  validates :is_live_album, inclusion: { in: [true, false] }

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
