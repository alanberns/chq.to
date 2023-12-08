class Statistic < ApplicationRecord
    belongs_to :link
    validates :link, presence: true

    def self.filter(params)
        statistics = Statistic.where(link_id: params[:id])
        statistics = statistics.where("date >= ?", params[:start_date]) if params[:start_date].present?
        statistics = statistics.where("date <= ?", params[:end_date]) if params[:end_date].present?
        statistics = statistics.where("statistics.ip_address LIKE ?", "%#{params[:ip_address]}%") if params[:ip_address].present?
        return statistics
      end
end
