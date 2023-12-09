class StatisticsController < ApplicationController
    def show_detail
        link = Link.find(params[:id])
        protect_unauthorized(link.user_id)
        @link_name = link.name
        @statistics = Statistic.filter(params).page(params[:page]).per(5)
        @start_date = params[:start_date] if params[:start_date].present?
        @end_date = params[:end_date] if params[:end_date].present?
        @ip_address = params[:ip_address] if params[:ip_address].present?
    end

    def show_day
        link = Link.find(params[:id])
        protect_unauthorized(link.user_id)
        @link_name = link.name
        @statistics = Statistic.where(link_id: params[:id]).group_by_day(:date).count.filter {|day,amount| amount>0}
    end


end