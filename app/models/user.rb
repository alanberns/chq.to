class User < ApplicationRecord
    validates :username, :email, :password, presence: true
    validates :username, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :username, :password, length: { in: 4..25, message: "lenght is 4-25" }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email"}
    validates :username, :email, uniqueness: { message: "Already in use" }
end