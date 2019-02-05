require 'date'

class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name]}
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: Proc.new { |s| s.is_released}, numericality: { less_than_or_equal_to: Date.today.year }
  # validates :release_year, presence: true, if:

  def is_released
    self.released
  end
end
