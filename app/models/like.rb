class Like < ApplicationRecord

  validates :user_id, presence: true

  belongs_to :user,
  class_name: :User,
  foreign_key: :user_id
  
  belongs_to :purr,
    class_name: :Purr,
    foreign_key: :purr_id
    optional: true

  belongs_to :reply,
    class_name: :Reply,
    foreign_key: :reply_id,
    optional: true

  
  




end
