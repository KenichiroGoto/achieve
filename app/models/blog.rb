class Blog < ActiveRecord::Base
  default_scope -> {order(updated_at: :desc)}

    validates :title, presence: true
    validates :content, presence: true

    belongs_to :user
    has_many :comments, dependent: :destroy
end
