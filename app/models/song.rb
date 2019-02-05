class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name]}
  validates :released, inclusion: {in: [true,false]}
  validates :release_year, numericality: {less_than: Date.today.year}, presence: true, if: Proc.new {|s| s.released }
end
