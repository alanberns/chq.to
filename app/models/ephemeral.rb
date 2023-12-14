class Ephemeral < Link
    validates :remaining_accesses, presence: true, numericality: { greater_than: 0 }
    before_validation do
        self.remaining_accesses = 1
      end
end