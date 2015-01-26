class Article < ActiveRecord::Base
  include ApplicationHelper
  has_many :comments, dependent: :destroy

  after_destroy :a_destroy
  after_save :a_save

  	def a_destroy
      publ
  	end

  	def a_save
      publ
  	end
end
