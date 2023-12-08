class StatisticsController < ApplicationController
    def show_detail
        #protect_unauthorized(@link.user_id)
        link = Link.find(params[:id])
        @link_name = link.name
        @statistics = Statistic.where(link_id: params[:id]).page(params[:page]).per(1)
    end

    def show_day
        #protect_unauthorized(@link.user_id)
        link = Link.find(params[:id])
        @link_name = link.name
        @statistics = Statistic.where(link_id: params[:id]).group_by_day(:date).count.filter {|day,amount| amount>0}
    end
end