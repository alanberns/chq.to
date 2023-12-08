class StatisticsController < ApplicationController
    def show_detail
        #protect_unauthorized(@link.user_id)
        link = Link.find(params[:id])
        @link_name = link.name
        @statistics = Statistic.where(link_id: params[:id]).page(params[:page]).per(1)
    end
end