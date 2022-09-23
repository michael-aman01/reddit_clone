# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    before_validation :ensure_session_token
    validates :username, :password_digest, :session_token, presence: true
    validates :username, :session_token, uniqueness: true
    validates :password, allow_nil: true, length: {minimum: 4}
    
    attr_reader :password

    has_many :posts, as: :postable, dependent: :destroy


    def self.find_by_credentials(username, pw)
        @user = User.find_by(username: username)
        @user && @user.is_password?(pw) ? @user : nil
    end
    
    def password=(pw)
        self.password_digest = BCrypt::Password.create(pw)
        @password = pw
    end

    def is_password?(pw)
        BCrypt::Password.new(self.password_digest).is_password?(pw)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    private
    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

end
