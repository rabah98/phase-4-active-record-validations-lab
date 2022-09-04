class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"],
        message: "category is not a valid"
    }
    validate :title_is_sufficiently_clickbait_y

    def title_is_sufficiently_clickbait_y
        clickbait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        unless clickbait.include?(title)
            errors.add(:title, "the title is not sufficiently clickbait-y!")
          end
    end
end
