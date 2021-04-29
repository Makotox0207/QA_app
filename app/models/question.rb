class Question < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :status, presence: true
  belongs_to :user
  has_many :answers
  enum status: {unsolved: 0, solved: 1}
end
