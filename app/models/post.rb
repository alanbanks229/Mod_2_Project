class Post < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :comments, dependent: :destroy

    validates :content, presence: true
    validates :title, presence: true
end
