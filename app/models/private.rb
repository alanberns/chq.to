class Private < Link
    validates :password, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, presence: true
    validates :password, length: { in: 4..25, message: "lenght is 4-25" }
    has_secure_password
end