class Feed < ApplicationRecord

    has_many :items, dependent: :destroy
    validates :link, uniqueness: true

    def daily_total_vector
        self.items.average(:score)
    end

    def positive_vector
        self.items.where("score > '50'")
    end

    def negative_vector
        self.items.where("score < '50'")
    end

end
