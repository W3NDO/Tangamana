class HomeController < ApplicationController
    before_action :authenticate_user!

    def index
        @current_user = current_user
        @tavern = Tavern.find(1)
        @messages = Message.where(tavern_id: @tavern.id).includes(:user)
    end


    private 

end
