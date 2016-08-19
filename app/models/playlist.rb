class Playlist < ActiveRecord::Base
  belongs_to :party
  has_many :tracks

  validates :party_id, presence: true
end
