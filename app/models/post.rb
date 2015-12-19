class Post < ActiveRecord::Base

  has_many :answers, class_name: 'Answer', dependent: :destroy
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  validates :title, :content, presence: true
end
