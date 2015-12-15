class Answer < ActiveRecord::Base

  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  validates :content, presence: true

end
