class CooksController < ApplicationController
    #before_action :authenticate_user!
    
    def index 
        @cooks = Cook.all

    end 

    def new 
        @cook = Cook.new  
        
    end 

    def create 
        
        @cook=Cook.create(cook_params)
        redirect_to root_path
        
    end 

    def show  
        @cooks = Cook.where(user_id: params[:user_id])

    end 

    def set_user_cook
        id = params[:id]
        @cook = current_user.cooks.find_by_id(id)
    
        if @cook == nil
            redirect_to root_path
        end
    end
    

    private 

    def cook_params
        params.require(:cook).permit(:street_address, :suburb, :postcode, :state, :user_id, :category, :price, :cooking_time, :picture)
    end


    
     
end