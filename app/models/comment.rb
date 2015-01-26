class Comment < ActiveRecord::Base
  include ApplicationHelper
  belongs_to :article

  after_destroy :a_destroy
  after_save :a_save

	def a_destroy
      publ
  	end

  	def a_save
      publ
  	end

end
