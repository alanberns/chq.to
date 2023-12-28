class Private < Link
    validates :password, format: { with: /\A[a-zA-Z0-9.,!#¡¿?*+]+\z/, message: "allowed characters: letters, numbers and .,!#¡¿?*+" }, presence: true
    validates :password, length: { in: 8..25, message: "lenght is 8-25" }
    has_secure_password
end