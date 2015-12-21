class Answer < ActiveRecord::Base

  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  validates :content, presence: true
  validates_length_of :content, :maximum => 10000

end
