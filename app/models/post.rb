class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ['Fiction', 'Non-Fiction']
    validate :clickbate_titles

    
    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
      ]


    def clickbate_titles
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title } 
            errors.add(:title, "Title not allowed")
        end
    end
end
