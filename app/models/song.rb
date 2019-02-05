class Song < ActiveRecord::Base
    validates :title, :artist_name, :genre, presence: true
    validates :release_year, uniqueness: true
     validate :is_released?
     validate :is_release_year_valid?

    def is_released?
        if released && release_year==nil
            errors.add(:release_year, "release_year cannot be nil") 
        end
    end

    def is_release_year_valid?
        if release_year!=nil
            if release_year > Time.new().year
                errors.add(:release_year, "release_year cannot be in the future")
            end
        end
    end

     
end
