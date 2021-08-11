class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :password_digest, :session_token, :dob, presence: true
    validates :email, :handle, :phone_number, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil: true}
    validates :bio, length: {maximum: 160}

    before_validation :ensure_session_token

    has_many :purrs,
        class_name: :Purr,
        foreign_key: :user_id

    has_many :replies,
        through: :purrs,
        source: :body


    has_many :likes,
        through: :purrs,
        source: :likes
    
    # -------------------------------------------------
    # Being followed:
    
    has_many :passive_follows,
        class_name: :Follow,
        foreign_key: :followee_id,
        dependent: :destroy
        
    has_many :followers,
        through: :passive_follows,
        source: :follower
        
    # -------------------------------------------------
    # Following:
    
    has_many :active_follows,
        class_name: :Follow,
        foreign_key: :follower_id,
        dependent: :destroy
        
    has_many :followings,
        through: :active_follows,
        source: :followee
        

        

    attr_reader :password


    def self.find_by_credentials(identifier, password)
        user = User.find_by(email: identifier)
        if !user
            user = User.find_by(handle: identifier)
        else
            user - User.find_by(phone_number: identifier)
        end

        # user = User.find_by(email: identifier) || User.find_by(phone_number: identifier) || User.find_by(handle: identifier)
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
