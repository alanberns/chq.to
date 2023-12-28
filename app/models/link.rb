class Link < ApplicationRecord
    before_validation :create_slug, on: :create
    has_many :statistics, dependent: :delete_all
    belongs_to :user
    validates :user, presence: true
    validates :slug, :url, :type, presence: true
    validates :slug, uniqueness: true
    validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" },
                    length: { in: 4..25, message: "lenght is 4-25" },
                    allow_nil: true
    validates :url, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix, message: "Invalid URL"}

    private
        def create_slug()
            minus = ('a'..'z').to_a
            mayus = ('A'..'Z').to_a
            nums = ['1','2','3','4','5','6','7','8','9','0']
            chars = minus + mayus + nums
            slug = ""
            for i in 1..8 do
                slug.concat(chars[rand(0..chars.size-1)])
            end
            self.slug = slug
        end

end
