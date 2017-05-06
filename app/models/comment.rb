class Comment < ActiveRecord::Base
  default_scope -> {order(updated_at: :desc)}

  belongs_to :blog
  belongs_to :user

  has_many :notifications, dependent: :destroy
end
