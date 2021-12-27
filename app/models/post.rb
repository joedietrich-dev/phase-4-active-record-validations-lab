class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

  validate :title_must_be_clickbait

  def title_must_be_clickbait
    if title.present?
      errors.add(:title, "is not clickbait-y") unless title.match(/(Won't Believe)|(Secret)|(Top \d+)|(Guess)/)
    end
  end
end
