class Restroom < ApplicationRecord
    validates :location_id, presence: true
    validates :name, uniqueness: true

    belongs_to :location
    delegate :neighborhood, :to => :location

    has_many :ratings
    has_many :users, :through => :ratings

    has_many :restroom_tags
    has_many :tags, :through => :restroom_tags

    def average_rating
        self.ratings_total/(ratings.size)
    end

    def ratings_total
        ratings.inject do |sum, rating|
            sum + rating.value
        end
    end

    def address
        location.address
    end
end
