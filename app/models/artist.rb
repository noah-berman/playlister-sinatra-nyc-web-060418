class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    unslugged = self.name
    slugged = unslugged.gsub(/\s+/&&/[^\w]/,"-").downcase
    slugged
  end

  def self.find_by_slug(slug)
    Artist.all.find do |artist|
      artist.slug == slug
    end
  end



end
