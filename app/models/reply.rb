class Reply < ApplicationRecord
    validates :body, :user_id, presence: true
    validates :body, length: {maximum: 280}

    belongs_to :user,
        class_name: :User,
        foreign_key: :user_id

    belongs_to :purr,
        class_name: :Purr,
        foreign_key: :purr_id,
        optional: true

    belongs_to :reply,
        class_name: :Reply,
        optional: true

    has_many :replies,
        class_name: :Reply,
        foreign_key: :reply_id

    # A reply optionally belongs to a tweet, but also can be retweeted
    # A reply can also belong to another reply of a tweet
    # A reply can have many replies
    
    has_many :likes,
        through: 


end
