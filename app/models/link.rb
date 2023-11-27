class Link < ApplicationRecord
    enum link_type: { regular:'Regular', temporal:'Temporal', efimero:'Efímero', privado:'Privado' }
    validates :slug, :url, :link_type, presence: true
    validates :slug, uniqueness: true
    validates :name, :password, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :name, :password, length: { in: 4..25, message: "lenght is 4-25" }
    validates :url, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix, message: "Invalid URL"}
    has_secure_password
end
