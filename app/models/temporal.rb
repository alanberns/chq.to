class Temporal < Link
    validates :expires_at, presence: true, comparison: { greater_than: DateTime.now }
end