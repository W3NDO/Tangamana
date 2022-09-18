class HomeController < ApplicationController
    before_action :authenticate_user!
    before_action ->{get_visited_taverns}, only: :index

    def index
        @current_user = current_user
        @tavern = Tavern.find(1)
        @messages = Message.includes(:user).where(tavern_id: @tavern.id).pluck(:content)
    end


    private 

    def get_visited_taverns
        @taverns= Tavern.where(id: current_user.visited_taverns.pluck(:tavern_id) ).order(created_at: :desc) || []
    end
end
