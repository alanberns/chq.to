class User < ApplicationRecord
    has_many :links, dependent: :delete_all
    
    validates :username, :email, :password, presence: true
    validates :username, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :username, :password, length: { in: 5..25, message: "lenght is 5-25" }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email"}
    validates :username, :email, uniqueness: { message: "Already in use" }
    has_secure_password
end