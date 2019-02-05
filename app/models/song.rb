class Song < ActiveRecord::Base
    validates :title, presence: true, uniqueness: {scope: %i[release_year artist_name]}
    validate :release_boolean?
    validate :released_year?
    validates :artist_name, presence: true

    def release_boolean?
        self.released == true || self.released == false
    end

    def released_year?
        if self.released == true && release_year == nil
            @errors.add(:release_year_error, "release year cannot be empty")
        end
        if self.release_year.to_i >= Time.now.year
            @errors.add(:future_date, "song cannot be released in the future")
        end
    end
end
