class Ephemeral < Link
    validates :remaining_accesses, presence: true, numericality: { greater_than: 0 }
end