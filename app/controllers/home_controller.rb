class HomeController < ApplicationController
    before_action :authenticate_user!
    before_action ->{get_visited_taverns}, only: :index

    def index
        @current_user = current_user
    end


    private 

    def get_visited_taverns
        @taverns= Tavern.where(id: current_user.visited_taverns.pluck(:tavern_id) ) || []
    end
end
