class Purr < ApplicationRecord

    validates :content, :user_id, presence: true
    validates :content, length: {maximum: 280}

    belongs_to :user,
        class_name: :User,
        foreign_key: :user_id
    
    belongs_to :original_purr,
        class_name: :Purr,
        optional: true
    
    has_many :repurrs:
        class_name: :Purr,
        foreign_key: :original_purr_id

    has_many :likes,
        class_name: :Like,
        foreign_key: :purr_id

    has_many :replies,
        as: :parent

    



end
