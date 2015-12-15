class Post < ActiveRecord::Base

  has_many :answers, class_name: 'Answer', dependent: :destroy

  validates :title, :content, presence: true
end
