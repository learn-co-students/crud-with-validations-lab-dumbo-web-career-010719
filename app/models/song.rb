class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year],
    message: "cannot be repeated by same artist in year."}
  validates :released, inclusion: { in: [true, false]}
  validates :artist_name, presence: true
  with_options if: :released? do |song|
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }
    song.validates :release_year, presence: true
  end

  def released?
    released
  end
end
