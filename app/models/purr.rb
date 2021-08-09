class Purr < ApplicationRecord

    validates :body, :user_id, presence: true
    validates :body, length: {maximum: 280}

    belongs_to :user,
        class_name: :User,
        foreign_key: :user_id
    
    # has_many :repurrs:
    #     class_name: :Purr,
    #     foreign_key:

    has_many :likes,
        class_name: :Like,
        foreign_key: :purr_id

    has_many :replies,
        as: replyable





end
