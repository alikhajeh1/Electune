class Song < ActiveRecord::Base
  extend ActiveRandom

  belongs_to :album
  has_many :performers
  has_many :artists, through: :performers

  validates_format_of :name, with: /(\w)+/i
  validates_uniqueness_of :spotify_link
end
