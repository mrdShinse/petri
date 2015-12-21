class Post < ActiveRecord::Base

  has_many :answers, class_name: 'Answer', dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  validates :title, :content, presence: true
  validates_length_of :title, :maximum => 100
  validates_length_of :content, :maximum => 10000
end
