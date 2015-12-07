class Article < ActiveRecord::Base
	belongs_to :user
	has_many :article_categories 
	has_many :categories, through: :article_categories
	validates :title, presence: true
	validates :description, presence: true
	validates :user_id, presence: true
end 