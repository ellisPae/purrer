class User < ApplicationRecord

    validates :password_digest, :session_token, :dob, presence: true
    validates :email, :handle, :phone_number, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil: true}
    validates :bio, length: {maximum: 160}

    before validation :ensure_session_token

    has_many :purrs,
        class_name: :Purr,
        foreign_key: :user_id

    has_many :replies,
        through: :purrs,
        source: :body


    has_many :likes,
        through: :purrs,
        source: :likes
    
    has_many :followings,
        class_name: :Follow,
        foreign_key: :followed_user_id
    # followings === other users that the current user is following

    has_many :followers,
        through: :followings,
        source: :follower
    # followers === other users that are following the current user

        

    attr_reader :password


    def self.find_by_credentials(identifier, password)
        user = User.find_by(email: identifier) || User.find_by(phone_number: identifier)
        user && user.is_password?(password) ? user : nil 
    end


    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end


    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end


    def reset_seession_token!
        self.session_token = User.generate_unique_session_token
        self.save!
        self.session_token
    end



    private


    def self.generate_unique_session_token
        SecureRandom::urlsafe_base64
    end


    def ensure_session_token
        self.session_token ||= User.generate_unique_session_token
    end
        

end
