class User < ApplicationRecord
	has_many :postings, dependent: :destroy
	validates :name, presence: true,
                    length: { minimum: 1 }
end
