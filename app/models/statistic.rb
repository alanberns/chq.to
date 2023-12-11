class Statistic < ApplicationRecord
    belongs_to :link
    validates :link, presence: true
    validates :ip_address, format: { with: /\A((?:(?:^|\.)(?:\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])){4})\z/ }

    def self.filter(params)
        statistics = Statistic.where(link_id: params[:id])
        statistics = statistics.where("date >= ?", params[:start_date]) if params[:start_date].present?
        statistics = statistics.where("date <= ?", params[:end_date]) if params[:end_date].present?
        statistics = statistics.where("statistics.ip_address LIKE ?", "%#{params[:ip_address]}%") if params[:ip_address].present?
        return statistics
      end
end
