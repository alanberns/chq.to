class Ephemeral < Link
    validates :remaining_accesses, presence: true, numericality: { greater_than_or_equal_to: 0 }
    before_validation :set_remaining_accesses, on: :create

    private
      def set_remaining_accesses
        self.remaining_accesses = 1
      end
end