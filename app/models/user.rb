class User < ApplicationRecord
    has_many :posts
    has_many :replies
    has_many :comments

    validates :full_name, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
