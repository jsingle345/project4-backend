class Author < ApplicationRecord

    has_many :notes

    validates :username, uniqueness: true
end
