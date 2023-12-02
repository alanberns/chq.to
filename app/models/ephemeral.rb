class Ephemeral < Link
    validates :remaining_accesses, presence: true
end