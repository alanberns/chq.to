class Link < ApplicationRecord
    has_many :statistics
    belongs_to :user
    validates :user, presence: true
    validates :slug, :url, :type, presence: true
    validates :slug, uniqueness: true
    validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" },
                    length: { in: 4..25, message: "lenght is 4-25" },
                    allow_nil: true
    validates :url, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix, message: "Invalid URL"}
end
